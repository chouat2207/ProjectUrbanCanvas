//
//  MissionDecouverte.swift
//  ProjectUrbanCanvas
//
//  Created by Apprenant 77 on 06/07/2026.
//

import SwiftUI

struct MissionDecouverte: View {

    @State private var mission: [ArtDetails] = []
    @State private var discoveredIDs: Set<UUID> = []
    
    private var discoveredCount: Int {
        mission.filter { discoveredIDs.contains($0.id) }.count
    }
    private var isMissionCompleted: Bool {
        !mission.isEmpty && discoveredCount == mission.count
    }
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGroupedBackground)
                    .ignoresSafeArea()
                VStack(spacing: 16) {
                    Text("Mission découverte")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                        .padding(.top)
                    Text("\(discoveredCount) œuvres découvertes sur \(mission.count)")
                        .font(.headline)
                        .foregroundColor(.orange)
                    if isMissionCompleted {
                        Text("Mission terminée ! Vous avez découvert \(mission.count) œuvres urbaines.")
                            .font(.subheadline.bold())
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black)
                            .padding()
                            .background(Color.orange.opacity(0.15))
                            .cornerRadius(16)
                            .padding(.horizontal)
                    }
                    ScrollView {
                        VStack(spacing: 16) {
                            ForEach(Array(mission.enumerated()), id: \.element.id) { index, art in
                                CardMission(
                                    numero: index + 1,
                                    art: art,
                                    isDiscovered: discoveredIDs.contains(art.id),
                                    onMarkDiscovered: {
                                        discoveredIDs.insert(art.id)
                                    }
                                )
                            }
                        }
                        .padding()
                    }

                    Button {
                        generateNewMission()
                    } label: {
                        Text("Nouvelle mission")
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.orange)
                            .foregroundColor(.white)
                            .cornerRadius(16)
                    }
                    .padding(.horizontal)
                    .padding(.bottom)
                }
            }
            .onAppear {
                if mission.isEmpty {
                    generateNewMission()
                }
            }
        }
    }

    private func generateNewMission() {
        mission = MissionDecouverte.generateMission()
        discoveredIDs = []
    }

    // Génère une sélection de 3 à 5 œuvres respectant les contraintes :
    // pas de doublon d'œuvre, pas de doublon d'auteur·ice, au moins 2 types d'art différents.
    private static func generateMission() -> [ArtDetails] {
        let uniqueAuthorsCount = Set(arts.map { $0.Auteur }).count
        let maxSelectable = max(5, uniqueAuthorsCount, arts.count)
        let minSelectable = min(3, maxSelectable)

        guard maxSelectable >= 2 else {
            return Array(arts.shuffled().prefix(min(3, arts.count)))
        }

        for _ in 0..<50 {
            let targetCount = Int.random(in: minSelectable...maxSelectable)
            var usedAuthors = Set<String>()
            var selection: [ArtDetails] = []

            for art in arts.shuffled() {
                guard selection.count < targetCount else { break }
                guard !usedAuthors.contains(art.Auteur) else { continue }
                selection.append(art)
                usedAuthors.insert(art.Auteur)
            }

            let distinctTypes = Set(selection.map { $0.type })
            if selection.count >= 3, distinctTypes.count >= 2 {
                return selection
            }
        }
        // Repli si les contraintes ne peuvent pas être satisfaites avec les données mockées.
        return Array(arts.shuffled().prefix(minSelectable))
    }
}

#Preview {
    MissionDecouverte()
}

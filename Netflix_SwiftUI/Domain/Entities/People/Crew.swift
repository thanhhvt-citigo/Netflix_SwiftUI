//
//  Crew.swift
//  Netflix_SwiftUI
//
//  Created by thanh tien on 02/07/2022.
//

import Foundation

struct Crew: Codable {
    var id: Int?
    var creditID: String?
    var name: String?
    var department: String?
    var job: String?
    var profilePath: String?
    var gender: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case creditID = "credit_id"
        case department
        case job
        case profilePath = "profile_path"
        case gender
    }
}

enum CrewRole: String {
    case director = "Director"
    case orchestrator = "Orchestrator"
    case vocal = "Vocals"
    case costumer = "Costumer"
    case dataManagementTechnician = "Data Management Technician"
    case grip = "Grip"
    case translator = "Translator"
    case visualEffectProducer = "Visual Effects Producer"
    case simulationAndEffectsArtist = "Simulation & Effects Artist"
    case compositingArtist = "Compositing Artist"
    case mattePainter = "Matte Painter"
    case animation = "animation"
    case visualEffectProductionAssistant = "Visual Effects Production Assistant"
    case compositingLead = "Compositing Lead"
    case lightningArtist = "Lighting Artist"
    case VFXSupervisor = "VFX Supervisor"
    case visualEffectSupervisor = "Visual Effects Supervisor"
    case VFXArtist = "VFX Artist"
    case VFXEditor = "VFX Editor"
    case CGSupervisor = "CG Supervisor"
    case leadAnimator = "Lead Animator"
    case visualEffectDirector = "Visual Effects Director"
    case compositingSupervisor = "Compositing Supervisor"
    case matchmoveSupervisor = "Matchmove Supervisor"
    case foleyArtist = "Foley Artist"
    case foleyEditor = "Foley Editor"
    case conceptArtist = "Concept Artist"
    case firstAssistantDirector = "First Assistant Director"
    case thirdAssistantDirector = "Third Assistant Director"
    case secondUnitDirector = "Second Unit Director"
    case unitProductionManager = "Unit Production Manager"
    case productionManager = "Production Manager"
    case specialEffectsMakeupArtist = "Special Effects Makeup Artist"
    case coProducer = "Co-Producer"
    case executiveProducerAssistant = "Executive Producer's Assistant"
    case artDirection = "Art Direction"
    case executiveProducer = "Executive Producer"
    case lineProducer = "Line Producer"
    case stuntCoordinator = "Stunt Coordinator"
    case assistantDirector = "Assistant Director"
    case screenPlay = "Screenplay"
    case coExecutiveProducer = "Co-Executive Producer"
    case soundEffectDesigner = "Sound Effects Designer"
    case makeupAndHair = "Makeup & Hair"
    case producer = "Producer"
    case stillPhotographer = "Still Photographer"
    case digitalIntermediate = "Digital Intermediate"
    case originalMusicComposer = "Original Music Composer"
    case themeSongPerformance = "Theme Song Performance"
    case assistantEditor = "Assistant Editor"
    case setDecoration = "Set Decoration"
    case productionDesign = "Production Design"
    case productionSoundMixer = "Production Sound Mixer"
    case dolbyConsultant = "Dolby Consultant"
    case adaptation = "Adaptation"
    case directorOfPhotography = "Director of Photography"
}

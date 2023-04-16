class InfoProvider {
    func artistName(for artworkTitle: String) -> String {
        switch artworkTitle {
            case "Girl With A Pearl Earring, 1665":
                return "Johannes Vermeer"
            case "Sunflowers, 1888", "The Starry Night, 1889":
                return "Vincent van Gogh"
            case "The Anatomy Lesson of Dr. Nicolaes Tulp, 1632", "The Milkmaid, 1658":
                return "Johannes Vermeer"
            default:
                return "NA"
        }
    }
}

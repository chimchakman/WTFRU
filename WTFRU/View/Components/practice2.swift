//import SwiftUI
//
//struct BusinessCardFlipDemoView: View {
//    var body: some View {
//        ZStack {
//            Color(.systemGroupedBackground)
//                .ignoresSafeArea()
//
//            SwipeFlipBusinessCard()
//        }
//    }
//}
//
//struct SwipeFlipBusinessCard: View {
//    @State private var restingAngle: Double = 0
//    @GestureState private var dragTranslation: CGFloat = 0
//
//    private let cardWidth: CGFloat = 240
//    private let cardHeight: CGFloat = 400
//
//    private var liveAngle: Double {
//        let dragAngle = angleFromDrag(dragTranslation)
//        return clamp(restingAngle + dragAngle, min: 0, max: 180)
//    }
//
//    private var progress: Double {
//        liveAngle / 180
//    }
//
//    var body: some View {
//        VStack(spacing: 20) {
//            Spacer()
//
//            ZStack {
//                CardFrontScreen()
//                    .opacity(liveAngle <= 90 ? 1 : 0)
//                    .rotation3DEffect(
//                        .degrees(liveAngle),
//                        axis: (x: 0, y: 1, z: 0),
//                        perspective: 0.9
//                    )
//
//                CardBackScreen()
//                    .opacity(liveAngle > 90 ? 1 : 0)
//                    .rotation3DEffect(
//                        .degrees(liveAngle - 180),
//                        axis: (x: 0, y: 1, z: 0),
//                        perspective: 0.9
//                    )
//            }
//            .frame(width: cardWidth, height: cardHeight)
//            .scaleEffect(1 - 0.03 * sin(progress * .pi))
//            .shadow(
//                color: .black.opacity(0.18 + 0.08 * sin(progress * .pi)),
//                radius: 16,
//                y: 10
//            )
//            .contentShape(Rectangle())
//            .gesture(
//                DragGesture(minimumDistance: 3)
//                    .updating($dragTranslation) { value, state, _ in
//                        state = value.translation.width
//                    }
//                    .onEnded { value in
//                        let predictedAngle = clamp(
//                            restingAngle + angleFromDrag(value.predictedEndTranslation.width),
//                            min: 0,
//                            max: 180
//                        )
//
//                        let targetAngle: Double = predictedAngle >= 90 ? 180 : 0
//
//                        withAnimation(.easeInOut(duration: 0.25)) {
//                            restingAngle = targetAngle
//                        }
//                    }
//            )
//
//            Text(liveAngle > 90 ? "뒷면" : "앞면")
//                .font(.subheadline)
//                .foregroundStyle(.secondary)
//
//            Text("좌우로 드래그해서 뒤집기")
//                .font(.footnote)
//                .foregroundStyle(.tertiary)
//
//            Spacer()
//        }
//        .padding()
//    }
//
//    private func angleFromDrag(_ translation: CGFloat) -> Double {
//        // 카드 너비만큼 드래그하면 180도 회전
//        let degreesPerPoint = 180.0 / cardWidth
//
//        // 왼쪽으로 밀면 뒷면, 오른쪽으로 밀면 앞면
//        return -Double(translation) * degreesPerPoint
//    }
//
//    private func clamp(_ value: Double, min minValue: Double, max maxValue: Double) -> Double {
//        Swift.max(minValue, Swift.min(maxValue, value))
//    }
//}
//
//struct CardFrontScreen: View {
//    var body: some View {
//        RoundedRectangle(cornerRadius: 24, style: .continuous)
//            .fill(
//                LinearGradient(
//                    colors: [.blue, .indigo],
//                    startPoint: .topLeading,
//                    endPoint: .bottomTrailing
//                )
//            )
//            .overlay(alignment: .topLeading) {
//                VStack(alignment: .leading, spacing: 12) {
//                    Spacer()
//
//                    Text("홍길동")
//                        .font(.title.bold())
//                        .foregroundStyle(.white)
//
//                    Text("iOS Developer")
//                        .font(.headline)
//                        .foregroundStyle(.white.opacity(0.92))
//
//                    Spacer()
//
//                    VStack(alignment: .leading, spacing: 6) {
//                        Text("hello@example.com")
//                        Text("010-1234-5678")
//                        Text("Seoul, Korea")
//                    }
//                    .font(.subheadline)
//                    .foregroundStyle(.white.opacity(0.95))
//                }
//                .padding(24)
//            }
//    }
//}
//
//struct CardBackScreen: View {
//    var body: some View {
//        RoundedRectangle(cornerRadius: 24, style: .continuous)
//            .fill(
//                LinearGradient(
//                    colors: [.black, .gray],
//                    startPoint: .topLeading,
//                    endPoint: .bottomTrailing
//                )
//            )
//            .overlay {
//                VStack(spacing: 18) {
//                    Spacer()
//
//                    Image(systemName: "qrcode")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 120, height: 120)
//                        .foregroundStyle(.white)
//
//                    Text("Scan Me")
//                        .font(.headline)
//                        .foregroundStyle(.white)
//
//                    Text("www.example.com")
//                        .font(.subheadline)
//                        .foregroundStyle(.white.opacity(0.9))
//
//                    Spacer()
//                }
//                .padding(24)
//            }
//    }
//}
//
//#Preview {
//    BusinessCardFlipDemoView()
//}

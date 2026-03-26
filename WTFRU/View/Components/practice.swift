////
////  practice.swift
////  WTFRU
////
////  Created by Sunghyun Kim on 3/23/26.
////
//
//import SwiftUI
//
//struct NaturalBusinessCardView: View {
//    @State private var flipped = false
//
//    var body: some View {
//        VStack(spacing: 24) {
//            Spacer()
//
//            ZStack {
//                FrontCardView()
//                    .modifier(
//                        FlipRotation(
//                            angle: flipped ? 180 : 0,
//                            isBackFace: false
//                        )
//                    )
//
//                BackCardView()
//                    .modifier(
//                        FlipRotation(
//                            angle: flipped ? 180 : 0,
//                            isBackFace: true
//                        )
//                    )
//            }
//            .frame(width: 240, height: 400)
//            .contentShape(Rectangle())
//            .onTapGesture {
//                withAnimation(.easeInOut(duration: 0.6)) {
//                    flipped.toggle()
//                }
//            }
//
//            Button(flipped ? "앞면 보기" : "뒷면 보기") {
//                withAnimation(.easeInOut(duration: 0.6)) {
//                    flipped.toggle()
//                }
//            }
//            .buttonStyle(.borderedProminent)
//
//            Spacer()
//        }
//        .padding()
//    }
//}
//
//struct FlipRotation: AnimatableModifier {
//    var angle: Double
//    let isBackFace: Bool
//
//    var animatableData: Double {
//        get { angle }
//        set { angle = newValue }
//    }
//
//    func body(content: Content) -> some View {
//        let normalizedAngle = angle.truncatingRemainder(dividingBy: 360)
//        let rotation = isBackFace ? normalizedAngle + 180 : normalizedAngle
//
//        content
//            .opacity(opacity(for: normalizedAngle))
//            .rotation3DEffect(
//                .degrees(rotation),
//                axis: (x: 0, y: 1, z: 0),
//                perspective: 0.9
//            )
//    }
//
//    private func opacity(for angle: Double) -> Double {
//        let frontVisible = angle < 90 || angle > 270
//
//        if isBackFace {
//            return frontVisible ? 0 : 1
//        } else {
//            return frontVisible ? 1 : 0
//        }
//    }
//}
//
//struct FrontCardView: View {
//    var body: some View {
//        RoundedRectangle(cornerRadius: 24, style: .continuous)
//            .fill(
//                LinearGradient(
//                    colors: [.blue, .indigo],
//                    startPoint: .topLeading,
//                    endPoint: .bottomTrailing
//                )
//            )
//            .overlay {
//                VStack(alignment: .leading, spacing: 12) {
//                    Spacer()
//
//                    Text("홍길동")
//                        .font(.title.bold())
//                        .foregroundStyle(.white)
//
//                    Text("iOS Developer")
//                        .font(.headline)
//                        .foregroundStyle(.white.opacity(0.9))
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
//            .shadow(color: .black.opacity(0.18), radius: 16, y: 8)
//    }
//}
//
//struct BackCardView: View {
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
//            .shadow(color: .black.opacity(0.18), radius: 16, y: 8)
//    }
//}
//
//#Preview {
//    NaturalBusinessCardView()
//}

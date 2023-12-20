#include "Particle.hlsli"

struct TransformationMatrix {
	float32_t4x4 WVP;
	float32_t4x4 World;
};

struct DirectionalLight {
	float32_t4 color;//< ���C�g�̐F
	float32_t3 direction;//!< ���C�g�̌���
	float intensity;//< �P�x
};

StructuredBuffer<TransformationMatrix> gTransformationMatrices : register(t0);

struct VertexShaderInput {
	float32_t4 position : POSITION0;
	float32_t2 texcoord : TEXCOORD0;
	float32_t3 normal : NORMAL0;
};

VertexShaderOutput main(VertexShaderInput input,uint32_t instanceId : SV_InstanceID) {
	VertexShaderOutput output;
	output.position = mul(input.position,gTransformationMatrices[instanceId].WVP);
	output.texcoord = input.texcoord;
	return output;
}
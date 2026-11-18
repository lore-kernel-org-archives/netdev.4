Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981800;
	b=Mgp8UizU4tu0jObH7XQ7UXhHJCykRVGmE0Od8v+6fefrEIzmZG74qwmTtC7RVPO6wZE5
	 6cwbyWqmTIn9twXrNuALwI0Falb+iDGCX6shiIZkPMQ0Z8JAldQ6LjUe8SOZs28+Sz9rl
	 WM7J0L8AUWm8C7Z+n+nn7rr7NbOMq8DvUwrlRw7RwNtVRRTRz50zIgKcnX4oAJLTb2Oa/
	 7edwLITsYsVlK2NC+nBMKj1b0qK8VfrlCTEg6LdK9cUtyE9MIldShql4+nDwhcZOIC8Ej
	 5+w2U2+hyhYaLsq7jTvrPAgqET6ITMGdPM+/4Bu18N3vf+RH6dcNDuOSO+o6KX2obeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981800;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=58lza+N58sloZR6E1LzFnfVustAf491GwYyn9ZqoTSk=;
	b=NMdbE9fbar9+qrPhUZJAg6gQ9MF79kLaqCkG4FUDjOR+6xLOQyogeuJW85qqvJOVe7nC
	 M6a+63Ozn4pnfZX6LNqZvb751jDWeN4xxWNRgbP/8a2T0V8RselzhmoJGAznro0RylRtx
	 d1v9Q1qAhc6VogwfdascyKQLnNrRkEN9R7UVBEbz+ND78/VlSHN12noGJZQIyMbXeD78f
	 WpUFMVjaxC2vdWcfNfhm5xjh+YpFIYt5XLOt08XaWUwJTFMDtuvGPbboK8LRXT9PDLUkp
	 GoIO2BsE0WYroYjXaun9ZKNHYjK+bdGt3VI+nujm022lfii06tKoAaW83hM4ZMYQ9RA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EKygsBqE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TcVvAXao;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A91606A325
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 06:03:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67A91606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EKygsBqE;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TcVvAXao
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UrS62383072
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 06:03:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	58lza+N58sloZR6E1LzFnfVustAf491GwYyn9ZqoTSk=; b=EKygsBqEsQzDW286
	tT03SPglrOUIoulYqIuzHpEu5MlW20/dEf+6W+VN4/r7IuXLHFP4Hqrf3i31U+bO
	Bvnn7107/uhMixlJi6mCc32jIJCJNpc59WrXf/upDybP4rhs3pr3pCDkHI6Nib1i
	NtKairIgV/cOAmJJl/V0p4kp/XHs5RPh0M5/8blqXZLNLW/i156JMp3FEP2XGQKi
	wp0ZUbSW4/5NhD/hnQW9FvRmi3U95bnvyEeiDa3/5cn7+12WqDAuUQtm3LtU+xUe
	rJjZ3+MpaCd9jbZtG2ZlEzXx3QXYMbHiqNXwX47CSikb9cnCR5lQ6KU59gf553wU
	D/XVMQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvasg7n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 06:03:19 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ed08be1c84so8975005ad.3
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 22:03:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794981799; x=1795586599; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=58lza+N58sloZR6E1LzFnfVustAf491GwYyn9ZqoTSk=;
        b=TcVvAXaocsauzxzkvx0D6ro9G6UimTqHnj57Bnlp/w9XwIKTFmDDGro6GUyM4xgc4Y
         FmQKWQ6lu04IVVF5QKsJoGTeZdicEhuaH2yraS8jmwCh9S1Jpg3tpYWVQHllF6w5WVkA
         2DTWQYfYHJv+ytQCKVmMK0xJ0cq1Z1/FeVyh/L2d+mSIiGVdLm6MrnF0UMGDHOQXDzdI
         SRqvMT7ASak89kBpSxXbyaxvyRFQ01sz++RqHUyYsloREuvHc53XvsvXmuQMvZAtfmqt
         rfCU3TUcBhXQEAorX5Q+nhtuVi6NzB0fvv1xA7PYH3Iy2K0rU0mZrnTuRi99SciMOCRK
         Yu/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794981799; x=1795586599;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=58lza+N58sloZR6E1LzFnfVustAf491GwYyn9ZqoTSk=;
        b=XlvaazhuI5EfqW5R4t9a1TEOmfuo8BkL0tWJ0id7TEWS2CoiV1YxyvH+GbXb25qGI5
         m0Qr1ZTmMCh8Jj4YxBzoVGwt4NQpah6GqCcDOojv8pl1aplG90cjGkVeysMmKGKPWbL5
         QvUMujJX94rJ5Ixbj4lG1pDgtGJdXwZ7+eJqsDx0aUWYBziVWBWcR2Gd/dYQ6/yL+J2w
         uBT/pvqH1pjbC8cdtD81I1vvo+PFpSChuwOS7XEbSiscuv6w69ipsiDq0VbaJr+eVPoF
         v55tnNbgczf97jEjgJA6+gR0IxiqflB0HY57zbTKwKql4UKc3o1IUql1WAjJ4TavzbDo
         Vxtg==
X-Forwarded-Encrypted: i=1; AL+hErEprexwAa3jSTCUlvIbrYOwL3QzuV3SjxqjYmCWK5IEG7ehKl8QO27bfpKsNCZRlnAAp16kUVw=@vger.kernel.org
X-Gm-Message-State: APuU4Z83JgEXmWNXPNdDht4u0L4slVfyLT+gDvKm5GjGwo19yEEnJLgX
	G5GbMrlJHZ1jJWIDga2ya9+6VR/RtXuTgO9Vf3uqdZ2ejOoP68DA7ECvbc/9C16s36OFHQ5pHSn
	CZ2ErBqFXDxNHDXuSx99E3WiFKyJ2Au5YgBQiNKunN7wTD7idoG1RuZYVVeo=
X-Gm-Gg: AZFdTZfjIpj7zPn8Eys3DgXnTnrGJ8IrnsIN5l/23Zz9L/p6Fv/hSjYPbwiHP3t3+zy
	zVl6aIcqChmIqoUFfdyS8A3qqWFfgiWJ4M9fPrhjV4WEH7FDuvD3dxQuLyQl7nOZMKClYi7lpYM
	NtMHbBf/9RwC6vP3RHdeqHjBo8GseGGiakkSAOv0ekvRb2BWHoZwRBXpxeNqcjmPzZtqUKmyKjr
	sp/EFbq5gszSlNP3nY7uz5RlKhpxScXrdcAAsndsKbqqtnKnJZOUkaI3hUP0P9J9BC5KuZnZLMw
	RL5SBJCemEeN0cWSQEOAg6c4I1OMQBBL2ZRLJTmm3JjbIDz7OC+F2j16rB+N5V2tPdGUAZYRMOF
	uplVV1MFInJupRCL/AkkLlKLoJ2+Es6I/5/QVO2rlstyvYEdgOlfcZNLdG3PoRbRR0PufWpXKOw
	==
X-Received: by 2002:a17:902:ec91:b0:2ef:dfbe:6380 with SMTP id d9443c01a7336-2eff72f34e6mr17388365ad.15.1794981798955;
        Tue, 17 Nov 2026 22:03:18 -0800 (PST)
X-Received: by 2002:a17:902:ec91:b0:2ef:dfbe:6380 with SMTP id d9443c01a7336-2eff72f34e6mr17388155ad.15.1794981798497;
        Tue, 17 Nov 2026 22:03:18 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62e38eesm7288805ad.76.2026.11.17.22.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:03:18 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:32:37 +0530
Subject: [PATCH 06/18] pinctrl: qcom: sc7280: Add gp_mn mux function
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-gp_mn_tlmm_support-v1-6-703f7badd194@oss.qualcomm.com>
References: <20261118-gp_mn_tlmm_support-v1-0-703f7badd194@oss.qualcomm.com>
In-Reply-To: <20261118-gp_mn_tlmm_support-v1-0-703f7badd194@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <quic_jingyw@quicinc.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Lijuan Gao <quic_lijuang@quicinc.com>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, netdev@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=SMzXx+vH c=1 sm=1 tr=0 ts=6afd3fa7 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=kPUZkI3t5WzYvoQfP0wA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: tHDEF7HO86LBptY5sspixoOj2rnIlxyy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfXw+cYV1wKeg23
 PdWrPq1XTT2LGJ7Ztyl5NaJt5PsrXBqhkrM8WiOL9f2Xztp0emCCmww4ClG6LnweG8/cyqc9YLa
 58OD0dbNirxBWc6wwUsFb9FTB+r3q0FWDeRTJjZiY+equuzDXUyEjTQkDiT9nDQdAJWtk2BYwHE
 9VCuGh6TCU6PMz9OUHl7OzwEyuOy0tFz5Ffc0DwqgtOJt++cmNFFuS0Pksd/ANVPe4DkIBRHSVE
 Y2Lm34rg1R3cAyvWRcNShWuuu8Kx6YJ4fzaHafKsjAuoRMCoVwxu9RLG7DamCg3KIJ3OwF5aGbd
 1CaWBXYfza5dI44hhDRkw2HSU5jijDrlNaM7Av42iC0Fnjfe9ECCunc64Z/JCemW5+WTi1RR7cu
 piBbK9iUZ7k61r3IT1apjXOvu7lLMwmJ4wWY0vIlZ5zZLmYTLTxx/HMvWGJUZc0g9Z1fF/UJLZb
 Uqxc5i8PG+2Xyh0683A==
X-Proofpoint-ORIG-GUID: tHDEF7HO86LBptY5sspixoOj2rnIlxyy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfXwX2UMaeDQtg4
 3kpCMB4d41o/51HijDRgczDeX8TBWlrns9T3REJLDVGvRZHgCe8M7JLb3fyCSG3Yc7eYoHET1SZ
 fgI4BZQRvyPXNyovlgGs6/7udwsI14k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180023

Add the gp_mn pin mux function on gpio60 of SC7280. This exposes the
GP M/N divider clock output on the dedicated GPIO pin.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-sc7280.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sc7280.c b/drivers/pinctrl/qcom/pinctrl-sc7280.c
index bb32a56649df6faf1aecd470435d74558c20db27..5e210b399f88f5beb68e511bca9c0dd93a1b75dc 100644
--- a/drivers/pinctrl/qcom/pinctrl-sc7280.c
+++ b/drivers/pinctrl/qcom/pinctrl-sc7280.c
@@ -515,6 +515,7 @@ enum sc7280_functions {
 	msm_mux_gcc_gp1,
 	msm_mux_gcc_gp2,
 	msm_mux_gcc_gp3,
+	msm_mux_gp_mn,
 	msm_mux_gpio,
 	msm_mux_host2wlan_sol,
 	msm_mux_ibi_i3c,
@@ -788,6 +789,10 @@ static const char * const gcc_gp2_groups[] = {
 static const char * const gcc_gp3_groups[] = {
 	"gpio78", "gpio107",
 };
+
+static const char *const gp_mn_groups[] = {
+	"gpio60",
+};
 static const char * const host2wlan_sol_groups[] = {
 	"gpio26",
 };
@@ -1154,6 +1159,7 @@ static const struct pinfunction sc7280_functions[] = {
 	MSM_PIN_FUNCTION(gcc_gp1),
 	MSM_PIN_FUNCTION(gcc_gp2),
 	MSM_PIN_FUNCTION(gcc_gp3),
+	MSM_PIN_FUNCTION(gp_mn),
 	MSM_GPIO_PIN_FUNCTION(gpio),
 	MSM_PIN_FUNCTION(host2wlan_sol),
 	MSM_PIN_FUNCTION(ibi_i3c),
@@ -1325,7 +1331,7 @@ static const struct msm_pingroup sc7280_groups[] = {
 	[57] = PINGROUP(57, qup16, ddr_bist, phase_flag, _, _, _, _, _, _),
 	[58] = PINGROUP(58, qup16, ddr_bist, phase_flag, qdss, _, _, _, _, _),
 	[59] = PINGROUP(59, qup16, ddr_bist, phase_flag, qdss, _, _, _, _, _),
-	[60] = PINGROUP(60, qup17, edp_hot, _, phase_flag, _, _, _, _, _),
+	[60] = PINGROUP(60, qup17, edp_hot, gp_mn, phase_flag, _, _, _, _, _),
 	[61] = PINGROUP(61, qup17, sd_write, phase_flag, tsense_pwm1, tsense_pwm2, _, _, _, _),
 	[62] = PINGROUP(62, qup17, qup16, phase_flag, _, _, _, _, _, _),
 	[63] = PINGROUP(63, qup17, qup16, phase_flag, _, _, _, _, _, _),

-- 
2.34.1


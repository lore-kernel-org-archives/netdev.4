Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795280886;
	b=4qDLVCvg0Fah0YXgS3R5zxCRBsodjtXnFt1EzzTTJbATPx/7kg+b7gRhr6Jk/V6l13n0
	 ajngzfPO/sDCVbuH+RV7nBmsdl5w95ygVMu2pmi6396iKCt4s0Vru0Oy5ttpjy2mlAftt
	 jVlpJpiPnjm+Fm7pOJgqfVWvCet6wTpGPUcNdHxQcdYrAfNt/5o+h08vFRAWbIM5FEcMc
	 QxTA9z12MqPsCgk9FEXzlB1VkI9mhbzLafWXtMticFSxAaJCD0BZARzSPQuVFLuka0uMX
	 OH8gxaSLhZxrMUO5sdIrC7uIbNY4FuvKSO6bEtqB+/fK90EuqukPfZVP/QNSiQ38IYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795280886;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6JMwvaxCTx+HUaMXGEdxOPJWtOy0hnILiJDEpf+rKRs=;
	b=vwobBKcRra8Jk7OuctYBTISNMPjDg/R76sxOVhek8+Pj2f/mbosTEu5os3t9V5JjPbhz
	 ODMLTttLVx/m+hyM2GJg6QLfpGb2vn/MS1SqdJvf90ZTGdxTmBDK/0WqWsClMWgm8TJHl
	 euDQ8W/BLww3JP3rjFU+5aj0RAvMDJFf+O/mreA5ERkouDoPcmup1sIP5v41SuSBWmA7X
	 XovnvReRpB4m7Rb6NAD5gHrVh09IrWeVO80/Ce/6n/C9Y665EVRMGUVvLwpiWidWhNNHD
	 zfY9+9Xn2jI4MNEOJg2bQ5GDS1cgG82FtEFT6fCNCt3QqRit/Zleia4qSO3KFByy+oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KHoLdF8y;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i8m0AiGS;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11822606A32A
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 17:08:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11822606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KHoLdF8y;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i8m0AiGS
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ALFaOO63432395
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 17:08:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=6JMwvaxCTx+HUaMXGEdxOPJWtOy0hnILiJD
	Epf+rKRs=; b=KHoLdF8yM3GjkwU2sghWWXbPZ9Wwc5pI+VlNa0W44zI6ta2xvmU
	0w6ncLwksaAn1dXPKME3Lf9X1uUkfA60VrutbRNwc4o5sBw9sBOTg6QxsWt7jZXV
	MU0/vP3DDap8kv16mn7XqDHkjvvEmALAodcIm5DZ83LKj9BvLZyIjt6gg9pV34RR
	R+to5Winke2EUh19thpNccvOZZkHTK0U7SfeujUZmxNh6Q0MdQy3E5feiFzjefHA
	oz4u8vIE4W8vB2W+DC02vub/MVfl/uK9FXtCODyBAaKPXYCIKiY811FX/V7hnoZE
	3Jgra3BhmXBkHdPq1zJqrgT50jNTUVbAqgA==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j34fk1e30-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 17:08:04 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8b0f1c06332so31875747b3.3
        for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 09:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795280883; x=1795885683; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6JMwvaxCTx+HUaMXGEdxOPJWtOy0hnILiJDEpf+rKRs=;
        b=i8m0AiGS1SCWF/1fVTjPy9dp5qw8iNXfdQpn0ByUNIPLdtX41UkEnNSAad2NbchT2X
         6CbQlzqoTL917/+cI42q39f/QkmYS4pHX7G8ZncPesyeK4C8+nEKyBFdAqkTGbnAQ9Ph
         yeLFo6XjJcCSC9dknclkmnARx3oXo4mo2da7y5HxMEa0Wu8JPHDSh+rI25j9tEzGlSNh
         VjpXFMSYVvzE7aHvGfjOw0zeCF24/yxt3jw6ExSEkqGi+CqmGV7w6pl6JmR6zUESTcjC
         AH0S/dLuPTU2QK+9Vd9QRLwqi+VsIflmlLG1JyOP2sgEOf4C2CKvjKx+t31Iv6gGLspf
         kyRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795280883; x=1795885683;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6JMwvaxCTx+HUaMXGEdxOPJWtOy0hnILiJDEpf+rKRs=;
        b=eyN3D7KJdhrZ3ZWuTwTSS4w1yrXxLea2LRD++ulLfpv5C0+doh/Pulhxv6GdQzoIQ4
         i1u27bNfIYpXJqWKJ248+vgDwcTfBurR0sXysSr+wsa38Xxxg7YoKAnDqgmFR52DiLn1
         dLYx2eUTD3JyRixXn8xODsZiAY1IkYM6eUjgoB/eKpI3+X44ZpnPuSakJiG4data5QqR
         ShOjXxGtXa/w2pfQxjGjYvhxSg4ipjpiF/IBohIVETrjMNFYZ+zhG3YpiBVFUHJ7L6iX
         IAy+AyjY0tsT5Cqy67U0LHEl9xIUE6bFy5rFiQrz9hmx7omikMuhqVXkGfNPZw4thzeZ
         5LYA==
X-Forwarded-Encrypted: i=1; AL+hErGSUygqf02hIo+cr/tAJ7daRw5g5DyafC7s0meUmifbVOIaX8ei7OjHUla9VWQCZUqZu2Opo+c=@vger.kernel.org
X-Gm-Message-State: APuU4Z9bUkuhZSHHOWWqlYbrQ6MP8tlvclRvW78xkxLHEP9ZXBt8PdqY
	yU/FAyniogeN/aKfwTZSbq+VgZrdtiTefOA5YjcaVakS5KhJOOS/bw4ScuVJ8dFK8Z6GUrxvKew
	f33ezRPo7xKvBd6Vj7cTp0MReQ48Kyd8q8cPkRSoRMeaSQ3GPjmk+5nWrC6U=
X-Gm-Gg: AZFdTZcxucZNDyCXZ3DRSiWmTPTklx59MNgaYsE53axD384dU1LRISOLKWygbjJEdrO
	UMK7NglI5Fw1Ptv9715fvD7b1WHokTs9JjfpHbm2NeCbyeurcyBFKsM5zhf/eLHnmTFGPjIFBNp
	0dYeRzu6hMF0km9vM7D1TXORiEchupVLTJHSVr+ZtwpT9Fb4twDs/T0e9EouAj6JNn7edPCOMQT
	OTnObaRfOj3mcnGkyskLczj6yTjgmrQxa7s6Xb1m/3DZzSRHwT3kf3bwLLIW3z+5UyfKouHuAYL
	bIsMEtE3QjHdtuW3ljzJNxrW0b9+i+M24zNOhWHnY+lrOx+SJJdbXI8HtyZ7isbnIgrrUy/M3wF
	KR1BIYuCZ89U2CjUVFtRceKytDMAWqqooJ9kpmlVMWnbccDiNrrtxVD93JOuxaQ==
X-Received: by 2002:a05:690c:620b:b0:8b4:c2c4:c5f4 with SMTP id 00721157ae682-8b5205537camr25045547b3.67.1795280883133;
        Sat, 21 Nov 2026 09:08:03 -0800 (PST)
X-Received: by 2002:a05:690c:620b:b0:8b4:c2c4:c5f4 with SMTP id 00721157ae682-8b5205537camr25045447b3.67.1795280882704;
        Sat, 21 Nov 2026 09:08:02 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb98b4dsm12945871f8f.53.2026.11.21.09.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 09:08:01 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH net-next] net: stmmac: eic7700: Use syscon_regmap_lookup_by_phandle_args
Date: Sat, 21 Nov 2026 18:07:54 +0100
Message-ID: <20261121170753.161170-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2887; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=K2miH5rqAJRKMoflINTVIzDqG1cCAkCBPvqZkVe/Cxw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBrAc/psZcP9FJ5lY0nUMSWSWhVysfAnvNdWEi8V
 /DTgiMqbPmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCawHP6QAKCRDBN2bmhouD
 19QBD/96ZEHrUEJ1Wt2vF2JDNxYNIqpgQn3W59iY8d6X1iKITuOmhcra0u586cS9kRhGt8+g5Lf
 GN8qLomatvA7zUx2yQNZzBWHLB33SclN3p5KdyjIJG3nJXqPPExxGw0K/Yiz18MafXmwFwAX023
 mfkGnxOPNV3Z1a6TTKKMMQ6k9t52GVrVVFJX0oQfevNQU3AkaPuRnJe26aitu/94RWhqTSYYmV6
 UoaEVPGoM34cjseqOp86ibCuqJ4qa7uiXLcJ+4fglk2NMcnYkw8AuVEx0Wf1nWJXSHQ0q/qGDTX
 t4ueEx5ia3F1fEoThkwVxolpGCVjMI9WtWgb9u9KmIdloyF3c5f1Jj8ZtIxVvu81q3PTwQdP7lZ
 3W7xaZYLFKTDNDsWGyO+K25d+eD3q9aoq7Bw3wKutb9wplJ/YlhZ63YIv0QYnY1zSsQXnCD6KGu
 anwp5Zg++bl0wVLBvS2hAdwVnocANkLY8gGjdWQXj/kDVW0vogjgnmdCi/UpiTG9gTeGnsP3YZg
 31Mcv2936IMA2gMj2cjR5FeCmx08UTRLCjmnzKfIeVs9v5Ca0XcAo01EBj9OK2vlYPgo1KxFT3m
 RWUbzV3iNCDdgbHJWHcGV4zBdcEYMYSkeZ3yKrjtBJVzHX4tAewuDWk2b9lAWM2AZGAoowLjgIU 7oE/rope89UpnsA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: YMCSnWqZmWyglZCxLVBxxSSSoTp7cmr1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIxMDA2OCBTYWx0ZWRfX6eJeF820esg7
 1DIdaCg7etj1vp3fJoyqZZkEkK0sacB+Js6aPGcXGIPbM+QTePbehK7EdLK7eTfetWQVhwyhi0j
 DEXAetdhUlgrTnaloofWtv1UuwbwBCtSc3WLFwjVFMdaQWVpqxjxCeFQi9tsHxwer7VKivTmWF0
 IvAU/mwo6oJFu4AwjIAISEoBawyLDmVlqA/O2WN7V8RVj6IahElWGH2LbX8JPxV2A5DkfPrzBNk
 hvLXGr/yRFLur0RmULr1fF3qOWBkbNZ+EwJ/OgcL2S4fomk4TlTyKkKcYL+FDK4HVh+auSY69RR
 /p3zojc1u7gyL64BYRXwduMLll6z700OCnyZ8+hw/4x8FAQ6n0W/sRQ1VHrRCIRvJEBajVWwlSc
 QJ5dmmcwoM6z6WK6L/6O5V2kHEiBSvtSc+1AwDvkqnAGGnCU9qtG28SSSbhL0tfAesraj086DtF
 C1XhBEsbTnVXlVRUmVg==
X-Authority-Analysis: v=2.4 cv=PsUG/AM3 c=1 sm=1 tr=0 ts=6b01cff4 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=8CrXmcB1Y8iGUmZwrFIA:9 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIxMDA2OCBTYWx0ZWRfX1isgzHBivxnd
 QAp3TicxuqVWNY8je/kHFUcGi5JDNgsMSx461jM/jPhWR4kLFKwcSWpjXughhr+1/tLrDFhGJXD
 GxPfs7ljNSnpFbSYh/6/ORp8ZxT/FiA=
X-Proofpoint-GUID: YMCSnWqZmWyglZCxLVBxxSSSoTp7cmr1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-21_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611210068

Use syscon_regmap_lookup_by_phandle_args() which is a wrapper over
syscon_regmap_lookup_by_phandle() combined with getting the syscon
argument.  Except simpler code this annotates within one line that given
phandle has arguments, so grepping for code would be easier.

There is also no real benefit in printing errors of missing individual
syscon arguments, because this is done just too late: runtime check on
static/build-time data.  Dtschema and Devicetree bindings offer the
static/build-time check for this already.  OTOH,
syscon_regmap_lookup_by_phandle_args() already handles error case if the
number of arguments is too low, thus switch is safe.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-eic7700.c   | 30 +++++--------------
 1 file changed, 8 insertions(+), 22 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c
index c229275b11b3..287f717ab3ed 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c
@@ -170,6 +170,7 @@ static int eic7700_dwmac_probe(struct platform_device *pdev)
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
 	struct eic7700_qos_priv *dwc_priv;
+	unsigned int hsp_args[3];
 	u32 delay_ps, val;
 	int i, ret;
 
@@ -254,33 +255,18 @@ static int eic7700_dwmac_probe(struct platform_device *pdev)
 	}
 
 	dwc_priv->eic7700_hsp_regmap =
-			syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
-							"eswin,hsp-sp-csr");
+		syscon_regmap_lookup_by_phandle_args(pdev->dev.of_node,
+						     "eswin,hsp-sp-csr",
+						     ARRAY_SIZE(hsp_args),
+						     hsp_args);
 	if (IS_ERR(dwc_priv->eic7700_hsp_regmap))
 		return dev_err_probe(&pdev->dev,
 				PTR_ERR(dwc_priv->eic7700_hsp_regmap),
 				"Failed to get hsp-sp-csr regmap\n");
 
-	ret = of_property_read_u32_index(pdev->dev.of_node,
-					 "eswin,hsp-sp-csr",
-					 1, &dwc_priv->eth_phy_ctrl_offset);
-	if (ret)
-		return dev_err_probe(&pdev->dev, ret,
-				     "can't get eth_phy_ctrl_offset\n");
-
-	ret = of_property_read_u32_index(pdev->dev.of_node,
-					 "eswin,hsp-sp-csr",
-					 2, &dwc_priv->eth_axi_lp_ctrl_offset);
-	if (ret)
-		return dev_err_probe(&pdev->dev, ret,
-				     "can't get eth_axi_lp_ctrl_offset\n");
-
-	ret = of_property_read_u32_index(pdev->dev.of_node,
-					 "eswin,hsp-sp-csr",
-					 3, &dwc_priv->eth_clk_offset);
-	if (ret)
-		return dev_err_probe(&pdev->dev, ret,
-				     "can't get eth_clk_offset\n");
+	dwc_priv->eth_phy_ctrl_offset = hsp_args[0];
+	dwc_priv->eth_axi_lp_ctrl_offset = hsp_args[1];
+	dwc_priv->eth_clk_offset = hsp_args[2];
 
 	ret = of_property_read_u32_index(pdev->dev.of_node,
 					 "eswin,hsp-sp-csr",
-- 
2.53.0


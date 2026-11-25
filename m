Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795635429;
	b=GueBzRVOtGA38rvS502OkoNxHvW0mDAZBqhSBpWh+NmJUIGtucKnjQss+/lSEMN5qmtq
	 2jPf10JLbaK8KFc+u/CDQ3QgHO7ZhQc/X0VZDdtjBnlyvllA69eTylHhfuJ2IM1Mcz0bT
	 jMDRjZg8g/ZMR3wkh9pjQWXtU2zQED48RpE9I7McVi3uQyFbqH/LKushito7zFZDL34B0
	 YR2M4xkZF53JkHFWZsJ+KIFkY2QoKvdUiG3NMyf1llrtGJCpyCCN0gijx+bU5f12wP1I1
	 FWwyfrwl7OXSNJq5YIQ8i1ZbMEdLkx6lkyzV0hcOAo6m89DOS1D+9o4WpPRHI/A/tNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795635429;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Wr5AGl2n5OMdlwfzUx+Xnt2cvomNzozcQctK34Lni/M=;
	b=vyma9Hbn1v+KyPDhBYrM+RVoiK5IlMFTsVSylnMuESvaMJ+FNeLUZm6Gi2LgfK4BPvaP
	 hMcmVIVMMwismoMJ5Ne5kt458IZVRSJH8oKDV/M+rTzl2DvdKjFpbnPC0yuWNgNGHNe0w
	 a2uFMmsHN7yF1UyNbAi1RmYgsL/SNG1BNo1r9lbJ5x5NK1U98tTmS3YPX2zOXOEFxTKIP
	 q434LdNvBo+Pd1wnI3EnwKNZnFJuzCAu/GeMtFfiPdQY9BFdbesAtlpkKfhawOnUmTuvA
	 WcZ0x2g9fGpT165uCdEny9y/IcfvmDM6dICp3xDy8bUiaKpqyIkkmE4BkeMO8VpuEQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=wepTSbla;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC672606A326
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 19:37:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC672606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=wepTSbla
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-490d59c3edaso4231963f8f.1
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 11:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795635427; x=1796240227; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wr5AGl2n5OMdlwfzUx+Xnt2cvomNzozcQctK34Lni/M=;
        b=wepTSblaEeD6BDobZuiECI6NpaWpQxmNVb5+heMLAhOmNymEnEg2uGyoUgMFe7w2sY
         VAJSkLloncRf4IhxUD5RTU6U5BaBrNWYZSC/JuILwiildpIjZmw+mITIFSyvVtDQ0J2Y
         dsgIfJBz7RynjzLyYDr8miM+gvtBsI0ZjotL34k8GHtxgfEcctYgzu0f4Usu87pxTtE/
         Nbp6pa6h/9iSWGkrU9tJo4POANrWz8SxeMLzW5bf91RMwMhAlvyfILK838iegdaPZUIp
         90lfksWkxvHqOm6S1azEdSPI3XYi5L8RCwkaR9gXBycxxYl/Gz9hVol1P72/9D17DhA1
         DF9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795635427; x=1796240227;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wr5AGl2n5OMdlwfzUx+Xnt2cvomNzozcQctK34Lni/M=;
        b=SOaSBTk0LVD/EzBIfBNSgQujf4G3Nk3GXIakN5Vzj0ppRXok2KiOfGYTPQzfMmCvwT
         PseBq9Vf3CVjBJwmCmZKCROX5NDQW9c+ogUIDElQfESnZckHVAON3PSXj0fIJYInU495
         kq367oop3G1iJ253vy266sR/5VmEL1wawLnFqF4QrQI1pI1SPd8orf8bhvdVbsWWmbaE
         SqntSikl9hwlybtHxdlOOxt7xGTEKLwtDCRcMXxri5PkRxdj4KW95VUxG4lNbG1TLEWn
         6GYRJ3QGg9v1duawufnoGYZIwB3bXtQ2fpjrwgjtRoQ4Eu8pw6cJOYggpQQjSriADsA7
         7cHA==
X-Forwarded-Encrypted: i=1; AL+hErHtbF8yVH+0kWgwvURO5MOgy8VoWvcM+L1zlyrhj/lG6f9q1J6N6qVgCi/U3fsopsCxqabPD0s=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pqSvUg/F6fLv4G04nsYlnvZuXrtxcywGrbv6O41R8rDB0rKYE
	fw0wiBiZxnAWGj6zoFBQkO40JH4kD4KKsZui8WNSWKyOdGsTkTspaDQB75qD73W3QvE=
X-Gm-Gg: AZFdTZfuho3gApzoeD/ogDm+t3ihb+P3rhF9sCnBL9GhlLeOewKI7xQOH3G90Fa8CeV
	AMTg4cbggn4bJvjgtFWdfs1T4F5dL8a0c7UefBESZ5fKJkr4WwWa3xgGjA/LDo+j6LKDgMVX4E8
	S/rEbSoUwkzWwUmHnCNZOA7/Y/ZiM7FhNK7srQA8vve5dZoO7nfclT86dttIzgsoMk4O/qC8Dzg
	EJdNLPlvrzadxf76fE2i+xVBpjLNg9zzim3wMQpopj0dAzRcLX36iU3ynEwgN321x+rfgmPksEv
	kfNGR9hy0m71JUeJeIzPW4GLBNvmPIogd5vSBglswdHaWIDamI9KcyXmyEH4i5R8sPIeDc2e4Au
	iULHk9lVQnkgCA2Bc6Wr7b/a+zN3lZLEX6t32ZglZhoBn0sJr+xWcEpxhlbV1CUOSNhZTPNJ3Jl
	/6QOd6i956ZrUlk888rKSudSKCo10ciEbCjJg22P8gAV6pc/duN6XHjDHER8otQjIWT1lceIw1F
	UkUo8b6SHXRegkRmBCMH10tpiQEPpX0NaRFyqqcz9b+PI8Zc6Wb2psXb5dcOv0Cv0fV2Mhrd8He
	jV3OG9EHnhUzLrm39pguACy0ScjGJN53M8cbZfkW/HmBE1tgOvSdaREi3Y9huNtYCCCZApg4TrZ
	J1vyI26CIBQ==
X-Received: by 2002:a05:6000:188a:b0:4a4:da59:aa60 with SMTP id ffacd0b85a97d-4abab4f5aaamr36933216f8f.3.1795635426983;
        Wed, 25 Nov 2026 11:37:06 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa3882sm35614063f8f.49.2026.11.25.11.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:37:06 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 25 Nov 2026 23:36:41 +0400
Subject: [PATCH v5 4/5] arm64: dts: rockchip: Move RK3576 OTP cells into a
 fixed layout
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
Message-Id: <20261125-rk3576-otp-cpuid-mac-v5-4-b3125c9a5fc8@flipper.net>
References: <20261125-rk3576-otp-cpuid-mac-v5-0-b3125c9a5fc8@flipper.net>
In-Reply-To: <20261125-rk3576-otp-cpuid-mac-v5-0-b3125c9a5fc8@flipper.net>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Willem de Bruijn <willemb@google.com>, 
 Simon Horman <horms@kernel.org>
Cc: Ryan Leung <untilscour@protonmail.com>, 
 Ricardo Pardini <ricardo@pardini.net>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3709; i=alchark@flipper.net;
 h=from:subject:message-id; bh=oXkReYjuRBJJEs/g0N/aMbEdzVAIdJ9dL3E3A7d18o4=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWSzW5xVaDb6V/mwdXXj4g3C817vE1xzUJyLs/rkPpG0z
 7sSDK6v75jIwiDGxWAppsgy99sS26lGfLN2eXh8hZnDygQyRFqkgQEIWBj4chPzSo10jPRMtQ31
 DI10jHWMGLg4BWCqJzYw/C+1sbB2ad93Sdpo57mgtQeW37eODV++MbLXuGMyc85BphUMv1n/RBY
 viI8NXqDlb8XNWs7KvdBreTcj7x0P3yaN+movNgA=
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

The RK3576 OTP describes its cells as direct children of the OTP node,
which is the deprecated syntax predating NVMEM layouts. It does not
allow a compatible on a cell, which describing the CPU ID cell needs.

Move the cells into a fixed layout, as already done for RK3528, RK3562
and RK356x. Labels and node names stay the same, so the cells keep their
names and existing references keep working.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 105 ++++++++++++++++---------------
 1 file changed, 54 insertions(+), 51 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index 6f5780af4192..2e83a73ddbb2 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -2298,63 +2298,66 @@ rng: rng@2a410000 {
 		otp: otp@2a580000 {
 			compatible = "rockchip,rk3576-otp";
 			reg = <0x0 0x2a580000 0x0 0x400>;
-			#address-cells = <1>;
-			#size-cells = <1>;
 			clocks = <&cru CLK_OTPC_NS>, <&cru PCLK_OTPC_NS>,
 				 <&cru CLK_OTP_PHY_G>;
 			clock-names = "otp", "apb_pclk", "phy";
 			resets = <&cru SRST_OTPC_NS>, <&cru SRST_P_OTPC_NS>;
 			reset-names = "otp", "apb";
 
-			/* Data cells */
-			cpu_code: cpu-code@2 {
-				reg = <0x02 0x2>;
-			};
-			otp_cpu_version: cpu-version@5 {
-				reg = <0x05 0x1>;
-				bits = <3 3>;
-			};
-			otp_id: id@a {
-				reg = <0x0a 0x10>;
-			};
-			cpub_leakage: cpub-leakage@1e {
-				reg = <0x1e 0x1>;
-			};
-			cpul_leakage: cpul-leakage@1f {
-				reg = <0x1f 0x1>;
-			};
-			npu_leakage: npu-leakage@20 {
-				reg = <0x20 0x1>;
-			};
-			gpu_leakage: gpu-leakage@21 {
-				reg = <0x21 0x1>;
-			};
-			log_leakage: log-leakage@22 {
-				reg = <0x22 0x1>;
-			};
-			bigcore_tsadc_trim: bigcore-tsadc-trim@24 {
-				reg = <0x24 0x2>;
-				bits = <0 10>;
-			};
-			litcore_tsadc_trim: litcore-tsadc-trim@26 {
-				reg = <0x26 0x2>;
-				bits = <0 10>;
-			};
-			ddr_tsadc_trim: ddr-tsadc-trim@28 {
-				reg = <0x28 0x2>;
-				bits = <0 10>;
-			};
-			npu_tsadc_trim: npu-tsadc-trim@2a {
-				reg = <0x2a 0x2>;
-				bits = <0 10>;
-			};
-			gpu_tsadc_trim: gpu-tsadc-trim@2c {
-				reg = <0x2c 0x2>;
-				bits = <0 10>;
-			};
-			soc_tsadc_trim: soc-tsadc-trim@64 {
-				reg = <0x64 0x2>;
-				bits = <0 10>;
+			nvmem-layout {
+				compatible = "fixed-layout";
+				#address-cells = <1>;
+				#size-cells = <1>;
+
+				cpu_code: cpu-code@2 {
+					reg = <0x02 0x2>;
+				};
+				otp_cpu_version: cpu-version@5 {
+					reg = <0x05 0x1>;
+					bits = <3 3>;
+				};
+				otp_id: id@a {
+					reg = <0x0a 0x10>;
+				};
+				cpub_leakage: cpub-leakage@1e {
+					reg = <0x1e 0x1>;
+				};
+				cpul_leakage: cpul-leakage@1f {
+					reg = <0x1f 0x1>;
+				};
+				npu_leakage: npu-leakage@20 {
+					reg = <0x20 0x1>;
+				};
+				gpu_leakage: gpu-leakage@21 {
+					reg = <0x21 0x1>;
+				};
+				log_leakage: log-leakage@22 {
+					reg = <0x22 0x1>;
+				};
+				bigcore_tsadc_trim: bigcore-tsadc-trim@24 {
+					reg = <0x24 0x2>;
+					bits = <0 10>;
+				};
+				litcore_tsadc_trim: litcore-tsadc-trim@26 {
+					reg = <0x26 0x2>;
+					bits = <0 10>;
+				};
+				ddr_tsadc_trim: ddr-tsadc-trim@28 {
+					reg = <0x28 0x2>;
+					bits = <0 10>;
+				};
+				npu_tsadc_trim: npu-tsadc-trim@2a {
+					reg = <0x2a 0x2>;
+					bits = <0 10>;
+				};
+				gpu_tsadc_trim: gpu-tsadc-trim@2c {
+					reg = <0x2c 0x2>;
+					bits = <0 10>;
+				};
+				soc_tsadc_trim: soc-tsadc-trim@64 {
+					reg = <0x64 0x2>;
+					bits = <0 10>;
+				};
 			};
 		};
 

-- 
2.56.0


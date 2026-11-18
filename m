Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795032329;
	b=RvGUO1ZbAIO6oIExwNwphL24T4ldYIZtza703pVjxr/mVpXiI0Rc1Mc6iWju9PaIr56a
	 nRPCVubXp2HJ3M8Etos+mZjT80WgeABJ0liG+AgPuGg46UzxW1WhCTTOQPsLD4lJPDNFV
	 jPPewH1tXoCjcm+YfJelW6Ppj063vtzaY7PrCNB1ABDIaF2RB7a7INF/yQIaQc5/ytX3z
	 pqbTqFVoZ2fGeRQETE7DkxiAbIJRiQJZLn7T/Rfftt1pf2o7UyFbCxmLSVrU4PAHuillj
	 3N7jtH1Q3VDJRrqNb70tCYdRDzCjtcreCmz3h6xp/IkCpsgbSDqIMC/iMJBnM2u51vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795032329;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vyE5jE78QejGeUNpk2fN0Lh2UcG+wGDugPW4CrDMAXI=;
	b=dmgrhnYz5dn4/UKH4U5+CF3R4C3oRxzMq77Ket9B9HMYs0NGVfQ92eaMONa/rUHwOFIa
	 URex/QWJ2VOkblTiEUSdrXC86kHHV0RY29vT2nu+NJ2rlPsI6vB84Y2mivjwIffbz2wqO
	 0lgHDgHbvPMBtOy5addHgWWHSHriUKKsLFTF4W3tGG+2zI6Cps9kpn7pzlzlFL0hx43fo
	 A4XzONzULwiHfnhnkgHFjWYM4GBgro2KJCNBJsFYVXo7EGDobeYsoKP+pQrMUW0uQrPKV
	 Yzvhmw86Aj60kxcQq/qS7PJcgf3FEdjlLipEimw22YEoSh3dLf7HLZbGKcpqOoHF6OQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=POupRKWv;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B379B60A261F
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 20:05:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B379B60A261F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=POupRKWv
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1a2761c69fbso1554619c88.0
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 12:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795032328; x=1795637128; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vyE5jE78QejGeUNpk2fN0Lh2UcG+wGDugPW4CrDMAXI=;
        b=POupRKWviGCLd+1OxweZTOkVriYNvVXgWS1eCPXRZB8HWLI70OkR+lFqcWAukrX8JC
         +O0IJ6Xpvr0/RoKtToAllK6ojWOK2WfdMf11fvYZq9YpmpyZraIHlTNjQ8Sq+t3JwaTM
         G8khywboxxuZXCy99u7yPpMJ2qrJ8N/sdTWsWHgzqXxhhUO30KtlDVHeQRbVvbNNJVgN
         TIYu7XP75cvXzYRoGyIVQ+P3IL6L4kCl77agjtO8g6klYhNYQLqU53p8FgW4iBFFq7LD
         dhgHhvlQTtbXUzjySEqeET16omvb482REfNkq9chkJCWFlQKfbdpBx49sCqn6cNPIVnR
         ZNJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795032328; x=1795637128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vyE5jE78QejGeUNpk2fN0Lh2UcG+wGDugPW4CrDMAXI=;
        b=voiQyKIuZscqMeFAnf/IpnMgR5z7csjXBWUioZNtrCJ2DpHRr3YMUQIg8VBIPSjnnC
         zPOytcxSz2D0mMxvURHkmxWufZfO2dLjKrJ1kb1C+LlpjPZiQgQaWXNn6SHsKFu57y7r
         ly+zyy5cMemIT06d/lABZOSNiJc4Asy13Y4gdQHh2mUZVEIDC0RGoJQ8HbFrnmByig4I
         Bga5aY88A2wesdlfr//7yg0PJSNaYdm4uKaLxg/zUzPcBj9tNIFu+hGaGlVHrC5NENh0
         oa/+CWUY9d5E/yWP6CMirpKwb2D1c9TGnHXcgkioaXaVAioPuXk5mwEdVBdiYN/TKnbf
         zR4Q==
X-Gm-Message-State: APuU4Z/shD0zln5i8yMn8mgnvYtG5PCF9Bvb54yxLC9W8o4aMFkcFhJ8
	lykMchAFePox07M/7uv+6/JOU3AXcuCd0wGkmfAFhXMHEXeTpUVJwFiMejhwXif+
X-Gm-Gg: AYBFou1MFRoO0ln90VHPVqp89iktbiUI+leqXD/+bhuHpEAsWgOUNDjls5Cn9+oRU8i
	9hhy83TEuaRJT+13EcCQleqchyLvYsiNZAQxlY8/ejTHkjG53KIhnZZ2PhEWslLQdLS+YGAmaZ/
	Dgi49cr02FVGrOQ1ukZlZyqP9ehpv5WFZV65LWeUyZHARBWoJ2cRYPP+IGe605UdwatLjCf6lUD
	fQBhmqihv8hHqUPh4x+loP90KqHHXV1P7Kb2n03Xveg5PJ/L5PIUvMNCr7RFW8yBr5dl66Hxhk6
	zw40REvmo82Pt35dEu8e9uxbIb+2pbPfL6Ci6tBzZjOXQpcTjZ78b6TnLJm3XV4YFcBAcFNPUtA
	pl5kvVp/+VFgmf5C+tc4+7DI0cULg3ZRvr7BKHcDG/51d8g7MS3MomiW+2xfWwCpq3iUbbwsPLS
	7pWE7grr2ThSxSOPi8SvZl+8+gp2ePyQ6fMjSwUHCiBxP7HjsrhrYztQ+RvkvWzSupnHXFELaRI
	XY3nQaIEDOmJL7XFrbI4qziMLvn381wI0x9XkwoJHS4ursyK6lFnT2rngN03MACjMV2HmnkGz71
	GBPx0V32tz6SZGlgxBLBrwsvY9B4q0ELBXVuNdrhnU7CKzKH6wDHULr7n08zmSgpV6FRVKJlP17
	GeTtqIvVWe/bQJi9Ymog4mIDsZTgS
X-Received: by 2002:a05:701b:4348:b0:1b5:342a:e4f0 with SMTP id a92af1059eb24-1b543b09960mr3155007c88.6.1795032327530;
        Wed, 18 Nov 2026 12:05:27 -0800 (PST)
Received: from Mac.localdomain ([12.162.234.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5445eb29esm8843535c88.0.2026.11.18.12.05.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 12:05:26 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev@vger.kernel.org,
	vadim.fedorenko@linux.dev,
	richardcochran@gmail.com
Cc: andrew+netdev@lunn.ch,
	arkadiusz.kubalewski@intel.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	jiri@resnulli.us,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	pabeni@redhat.com
Subject: [PATCH net 4/4] ptp: ocp: correct the DCF output frequency
Date: Wed, 18 Nov 2026 12:05:24 -0800
Message-ID: <20261118-timecard-common-301f823ddd-4-ahmadexp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261118-timecard-common-301f823ddd-0-ahmadexp@gmail.com>
References: <20261118-timecard-common-301f823ddd-0-ahmadexp@gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The output selector table uses 77000 Hz for DCF, whereas the input table
and the DPLL supported frequency list use 77500 Hz. A request for the
advertised DCF77 frequency consequently fails on an output, and reading
that output reports a frequency outside its advertised set.

Use 77500 Hz for the DCF output selector as well.

Reported by the netdev Sashiko AI review and confirmed by code
inspection. Source-derived C regression tests pass with ASan/UBSan;
restoring the faulty selector, mask, disabled-state or DCF value makes
the corresponding regression fail. Tests use stubbed MMIO, not hardware.
The driver object builds on current net with W=1 and KCFLAGS=-Werror. No
physical card was tested.

Codex prepared the fix, tests and changelog from the review and upstream
source, at the request to separate common-driver fixes from WiWi support
and validate removal ordering.

Fixes: 09eeb3aecc6c ("ptp_ocp: implement DPLL ops")

Link: https://lore.kernel.org/r/179502617840.3136.12704245716223038161@kernel.org

Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
---
 drivers/ptp/ptp_ocp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
index 650047581f..aa950cae68 100644
--- a/drivers/ptp/ptp_ocp.c
+++ b/drivers/ptp/ptp_ocp.c
@@ -1376,7 +1376,7 @@ static const struct ocp_selector ptp_ocp_sma_out[] = {
 	{ .name = "GNSS1",	.value = 0x0004,  .frequency = 1 },
 	{ .name = "GNSS2",	.value = 0x0008,  .frequency = 1 },
 	{ .name = "IRIG",	.value = 0x0010,  .frequency = 10000 },
-	{ .name = "DCF",	.value = 0x0020,  .frequency = 77000 },
+	{ .name = "DCF",	.value = 0x0020,  .frequency = 77500 },
 	{ .name = "GEN1",	.value = 0x0040 },
 	{ .name = "GEN2",	.value = 0x0080 },
 	{ .name = "GEN3",	.value = 0x0100 },
-- 
2.54.0 (Apple Git-157)


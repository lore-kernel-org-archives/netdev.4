Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794777697;
	b=kbrhmHMISGUEKPKGf7DKsDXR/b+xGGetIsrpi3saYpoDT+qjz2l10366A+MBN+dy7DxY
	 hkus7a4iPaGDlKFyKEoI3Z6A1GEjuJfAtdA/a+q4FHZMPc4HbK6xw0Z2EcRSynHsPQzFq
	 CAM76jd0aYsd8NkLMrql1ePvHEfpY1OL0Qzfnhe+s++/XUc4JpQjO8ktkZWulLj4l66Y+
	 +9SD7PisZJKT7thMR/TqBpsmOMyclNHXgbIplWNcexaLE1QefAM6ZLOODmAE3EeEVIihB
	 Oa+pBgWxkKY9UIjF6af8EYdY+TyBFYI6vPKfIFj/27oxQUAHjFdskxA99NRa/lRrT2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794777697;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=U+TujgQ1BSv/6MjNJRe3WggEHkX9fvK2a6kRHkLOphI=;
	b=E8XYzBBt6vgjRQU7nwcXWvHjFuFYAdsIwFDzOasBNDDQ6E/Ev2AFFRFj11+OhB44hawi
	 kdwDSOzON+J97LBLp2mrRkE9cmWYz42L6W2q4CGpbLUl97kzyNzjohhqxyr6r2LL7BaCM
	 yS2OKCEWRNVSPyoP2zkFmJoMnFwZ4OPLtzJqdv1YcboLIqokTB7qHzrmt3iRa+L8aSejf
	 YJb2fjKzQQhjiOE9q1hhKjcWj8vVP4UnXsoUe6j82ya5F/b925eRESBN+uWHqbMkQMwOD
	 ap+k1bgFevkRTGmfZqNhr44rdoEihoybEQd7rqalYapXlJoO4Ooww97dZI8IuDf0DMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=agEhoXKQ;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A002606A32C
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 21:21:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A002606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=agEhoXKQ
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a7a3b29c11so2977315e9.0
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 13:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794777695; x=1795382495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U+TujgQ1BSv/6MjNJRe3WggEHkX9fvK2a6kRHkLOphI=;
        b=agEhoXKQZko8bWKNlYxvZnSuZxTEFOAB6dprNXg3wBYx1g+Ln8WIwf64vbZs/XcPON
         0/QhMLpasTuzhFHeo2IeqL71xMbjbhWyUYmFw7eXnGCKieUdV3jr3VwLzkL89cSULzMB
         xAvKL6ck0ocm9TP4QAEy8ka5xvnobcyDJ/jRdS/TLdB/oLEFdQ+iiGgSOOmZepsfkYgO
         DVh8+4lCkqX8Vopm2PCo+FoTW7JhKM5cHIbSPA5fWhJAK02mwBR6AomTb/JGDc8S+xo6
         A4wlSMc3Qxz18C/gZ6OW3d3yJHpIFgPY9uvsP2VlxtWYVPLc9BnPdg6CEmcmdGzqNWv0
         uCdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794777695; x=1795382495;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U+TujgQ1BSv/6MjNJRe3WggEHkX9fvK2a6kRHkLOphI=;
        b=yzV8ih66yn1MlfnrTUN7IS0n03isGbmb0r2AUlflpbAemyimF2AvNaiOTScbg4XbQk
         m5j/YONAjGgyAKMLz44aCZABoX6Mwrvv/nNCWn1gchRRR/pSQSlwFC7ODJDVleQk+p3R
         U+31+BISe1f8ZL3ALPHl+pO0bGeWv6qlQ4JOWa3U5kEhXdsac4z5twAsLSBh/0DfGu0R
         H2e7800zfuVEMFh+9Qj8E6mymdRXg2PX/X0qmxSQji5MwCzn2ZbAUGZvQgQ9WB5cwW9C
         D7JtLP4tpjhAtHW8AmWEVES2vUeBzMKXx6+akfmnp9We/mgslicp3Sb+drZ1yEKNv+Ct
         cX1g==
X-Forwarded-Encrypted: i=1; AL+hErEOJP5hDeFhGfRxWy/gME2sYmC9+n7fKSBJL4F0KzynOMAZTM9SN63ay+IWFKlgti4ZNiGb4rw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9CSH48r4slh+tLlEggSYBQwkFs+Cf4CC+x4hkZK8fr2x5BIyM4
	EeHDDMnpWe9StwXn1D5vVXX56jH2HHrkSTgLADFra//okvBAKL334dKM
X-Gm-Gg: AYBFou1C5gtZf4DkqeyK+QJYBBF2wL1RjP6cVeFrL6kBz5vcsQ6k35U8+9eGyMUBmt6
	EhRkXDSUUb2rkxx9HIm7qlPtNa8v47HeTO+sjQ5P1SgCOot/61njupuvqDnAG1FhCvAsIVKDbsF
	ccpyT4xA0ylnqL664PbcEOQTwEn6O95bDTpYsLMG6EYozUDHb+4vqQgRiVAFB2L8pmCBYbCFNy3
	ntFhdWRIn/JQ/m93ENq/QAeKmoC1DSbzMlfQCfKvMvU2qnneZMthYxRzodhlAWc8feifrAjkGSO
	LlYFom7JXtHar8Ylz15/sD+Ekusjs0lmVDmkgBJaQ5bYqnFDuC9tBI1l6gwJVQB1tNs3N3a133f
	tNe7kiksp8Hk2+w136LJ15jBO21u0DXYFW7DkEYjKZHf6uNb+xCvuI97LZ+VTWFs0nvoK5ia0fB
	Y49+jZXSel/tTeDFXFRJRfsxLYL2Lm2KIjhSUMAOJgbjB92QhmPqs4dm/8sN9YSzWogfGQIuxdr
	i+5/sKIUFpChhk7Yhu30DERaIFDhcqiy68TeSKkWDxNB0Sbm14FQ9MGnPxVlHDKU56ybZmwCju/
	bVD5dv0nzx6sYr+TdeAl8bWwKCvMpBb/FbuuCKjBjewZ/1F75EzjG1q2Ow3cNKigToGb2OsC
X-Received: by 2002:a05:600d:644d:20b0:4a1:b027:99ef with SMTP id 5b1f17b1804b1-4bb55a3f05cmr146093485e9.2.1794777695431;
        Sun, 15 Nov 2026 13:21:35 -0800 (PST)
Received: from Nuel20.localdomain ([105.112.221.201])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55a0ffcdsm217726975e9.0.2026.11.15.13.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 13:21:34 -0800 (PST)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: kuba@kernel.org,
	tianyi@cloudflare.com,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	skhan@linuxfoundation.org,
	Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Subject: [PATCH] selftests: net: veth: propagate channel-check failures to exit status
Date: Sun, 15 Nov 2026 22:21:16 +0100
Message-ID: <20261115212117.48496-1-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
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

chk_channels() reports mismatches with a "fail" line but never sets
ret, so the script exits 0 even when channel counts are wrong. Every
other check helper in the file (__chk_flag, chk_xdp_feature, chk_gro)
sets ret=1 on failure, and all chk_channels() call sites expect the
check to pass. Set ret=1 on mismatch.

Fixes: c017800af5c71 ("selftests: net: veth: test peer ndo-xmit after GRO toggle while down")
Signed-off-by: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
---
 tools/testing/selftests/net/veth.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/net/veth.sh b/tools/testing/selftests/net/veth.sh
index 64c2a5a59821d..5c1dbe1516bb4 100755
--- a/tools/testing/selftests/net/veth.sh
+++ b/tools/testing/selftests/net/veth.sh
@@ -130,6 +130,7 @@ chk_channels() {
 		echo " ok "
 	else
 		echo " fail rx:$rx:$cur_rx tx:$tx:$cur_tx combined:n/a:$cur_combined"
+		ret=1
 	fi
 }
 
-- 
2.43.0


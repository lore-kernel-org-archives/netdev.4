Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795048225;
	b=tSVmxKPTwAs+ddFOV4s1MOK/0j+yXQMa7A0i24YFSYQ3VAZWkjcVLBDy3/cYBHMukyAw
	 pytwJj+9jS2ef3/MAAqBTc+6SWQV7Wnb2AP2VxTxOetc68hoOSbyoDcrBuZJYMf6EtlBT
	 GTw5xjtsgnAUxoFXwaeMyJF4ogxRiWY78Y9ocwgVYq4sVd/+oUVjTkquWWaxQFeo8ZhIu
	 xgNNqtTIeFKDZQTVkvJjk6L4L2HMvnbdUqFOOeDlMN30oENPMys5d/aYm/EcuCGOwz2U1
	 GGDwU9v7hHmVzhfgNfyO7dstkYZOnHMH+ApLkWLPVE8Bj4uAXN7tsWJmasK08e3TRXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795048225;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QAnazgbAEbBUyJvl2IrarULxEN8A8O9+J2KxABxOX8o=;
	b=A3vxMLLDVVrU/2+8sa7R6eCp3y/euVuT5S88/MNx0aYxuW+LM478jvfafsQRezab5Tc6
	 pF+Y9mXh5xCodichLlzwCxeErG5thIQYVRNl6sxgwBPEbncMRyaFezkSGPU8mSTEwqeNS
	 CUwcL2Q89E6DxPBz+M4R1igphLZUm5BJ8NHEmzcsBwRMt75tf+pxaI7S3Khk+ESH5kjZB
	 VKobfBx3hYxtuD8+iO9dlnwOL+Q3eBqqr2C53ZQWLfKZXfUMlZZV3HevDd+Oe2VZP9rBZ
	 hbpeUOZqRtNvVYy8ZMLfipL06MFX/euQwkHZlTqCwo+mpQjEActBzxPD2zR4G6fA0RA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pZOt97z7;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00AEE606A332
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 00:30:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00AEE606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pZOt97z7
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c50686daf9cso40442566b.0
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 16:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795048223; x=1795653023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QAnazgbAEbBUyJvl2IrarULxEN8A8O9+J2KxABxOX8o=;
        b=pZOt97z7oXYPDrXer2WA3LC4yS2BO044M6yHvur62qVooM8RRujv164PxvZTmPo/pC
         YTEyg0l2pdWvhT0e5vGapkbYWYaYe3zfm57V5SEkCRSwoYTGKPt+j28zJ9yFfRInOOuB
         lzSi+wlIQEF81Lp9DT3Umx/ywacnX078dJoyLGYL9vOlkpyQFEyjy/DF9LiNhwPi5EyT
         Git1WOgf3JoINy8xjyg1h/YpZYHcf6SXMKRVkDFoTJoaB7P7W4H0f0kvgM7IIh+8lO9R
         X4InlCI0k0LphUqOqKDtpA8OnIVQAbh7KPZ73XVJDa8x/3ujv3VJNy9ATUKlAHSKa9HK
         Biww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795048223; x=1795653023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QAnazgbAEbBUyJvl2IrarULxEN8A8O9+J2KxABxOX8o=;
        b=CiPPryUptC0SZpSEgDOl0NtDyvuDhuatpmJl70WelBpgiJyDQnAg9MIx0xr+Eh2bPj
         t9wFYB+BWo4elQXzH82sn/4ukztxuG0531oUMACC6czdKrsNLMyl9Lkj4XNaDqcCAjKr
         WtNe4z/bc6HVhKQQrOUr73S/nkl+yB5++HqqFNabpyG4DmCD8wvy+WcNq1W4XZngy569
         YUG52mNfE9phvIzjFTCfBgZCDNwWOEJ2ekUBztS8zvaIx9b/L9eBDmWoheI0XVI9UIeu
         d4iuVgAHeKUPRt+vKFMS5XP+oYIl3eQSkvxJOVN/BzGfGNqPLygC6e2/1Il6lyIzqJrE
         39pg==
X-Forwarded-Encrypted: i=1; AL+hErG5KMsoiZOtW2nxiK6CFzVdAeLlf4KH2L9EOv9BUp5BXhDm4CLHHTG3xIstidSU2HrXk/b+vZ8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9X9WcZTOE/8bsR/zjA8SaSYjsNNzk1/LEDKYxkX8Io6wRDDC4v
	8GxfnEIjfuW9TMlFoRjAZWaztlLXcJSvIM5X4XHbPsIaI/TFvlAGS5dp
X-Gm-Gg: AYBFou2YvLFpFQGLduchLBYJI/JFsUJnyzCHgX2kljusCJY+SmRURDv9AVQ1J6qMG3F
	RQ35aTFelFtZvwP/J2cDhsMzTHX/PyUG/Mx8kPyCb3m4njRuW0ohXQH/O4jbl+C0O9LY1WiEW98
	PJuc0r3lG5TwlJsFqua8cJ/c8Xo9CGusAWEUpdM4r683UgJcN9bVZZXs7yR0pDdegTDPEUXLplI
	DLHEn9FpXu8kNlUQilJrDjF9QdE8i0EScGB9cg831QMqZjUAxcky0DYERDpWX4EBP7l7BibXNoK
	s92Bk/MzzoQrec4Ew1rzF+JI7sEC03PXlOkc5yi4dyRBmvc051f4AHGQbWzdVj2b1Jy65z30l5o
	lXqnxfnvoZ1IeqxP79ik7ewdGh6IHivEQXwCEvuoHONj2UpH2cbPdUDgVbIgfYNpnAmDepIqr/w
	MefY/xfJ6GL6JV78mRY5NDyPTKMTe2a3BB2eeb1jEv5V5bNeolpnd1i0mzhtOTi0HP28IEouwY+
	7Z/XXWrEBj5StXpOr+wv5ugQRM3XiH0e9CBeYRy+hM0Zo+MEIspBpxYxO8QQjx4udXaKafojCk4
	WnndavcAnDHLrxRSQDFf8gMPw8jrZCxbVoNj7qv6Zb1Sd05sdhWcGDy51hQ+iFqxM3EhtIyBxA=
	=
X-Received: by 2002:a05:6402:2422:b0:6b8:4f3e:62c8 with SMTP id 4fb4d7f45d1cf-6b8877decc6mr4950784a12.0.1795048223372;
        Wed, 18 Nov 2026 16:30:23 -0800 (PST)
Received: from Nuel20.localdomain ([105.112.208.161])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b88a001123sm1729744a12.21.2026.11.18.16.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 16:30:22 -0800 (PST)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: tianyi@cloudflare.com,
	hangbin.liu@linux.dev
Cc: kuba@kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	davem@davemloft.net,
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
Subject: [PATCH net v4 1/3] selftests: net: veth: propagate channel-check failures to exit status
Date: Thu, 19 Nov 2026 01:30:00 +0100
Message-ID: <20261119003003.40482-2-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119003003.40482-1-emmaonana18@gmail.com>
References: <CAG4wq-d_30-B4wQZu48ZQXAORM4QxRqPfmYsmoHS0hiYp1EtTA@mail.gmail.com>
 <20261119003003.40482-1-emmaonana18@gmail.com>
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

Fixes: 1ec2230fc721 ("selftests: net: veth: add tests for set_channel")
Tested-by: Tianyi Gao <tianyi@cloudflare.com>
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


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.146.106.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795318634;
	b=31inCZtn61Uuqb86Lha89LRDyvzfbukvnz3fMuP6f4MyPJFhXCKcBWbzUiXICczkuqZu
	 MHKMTek7B/Drtlrpso0Ij0r5B66q0fm5s2iDeJbzg7PkDZcDmDdn7PgRF/WCVHAO2BrGC
	 0abvlKumm2gMArXfbKJbbxPitEEoz5ym3FoO4ZZRf/NQ8shHfFmL1K48JX0Q3TKa1l8Tj
	 jfRZ0kA/BBfAlpDyW089rETz0C+5nM9rVW0nnKWh826YZQ2mG3woRL7Jq0aRInHazokLu
	 HLML9ququlscAj//Pc2we7tbHmrRbcmYLS6r5iwqxf00fSCKhgg2Lrq797ho4160DIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795318634;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=kQpednrakk+EZwN9ETI5a7BrP3ajGtGSIYnARNx8U+A=;
	b=k1LtespExNbQ/eoEPZ0ieXz5S8JUdMUS5GDsUr7KqVCo1cFmjRhjvpceITqbf9cBZ0HY
	 z4jJ3gON+6G0zoFHKF+X0H6vZb143+lqcBcqTq+JSa5BvEBzsr0b4beXJhGOZ3vMrp2cS
	 7jNqQdQOW/Y6ojlhp/xSbEnzDiK2liEkg20z6I7bsCltjh5cTwjLM3t+7qo1YyxsOxszc
	 IwkI6GHCVqoe9YxRQE4HgSN9O54vBIg7swlIUuS1SdP8kTMFWmGlZ4nwlelXJxtRPUlXd
	 GhpVoE2AlpqMTBaa/C60hzgwlZ+5E8FdoLMnQZmybebNOvhAR/kk/nULHEiS39riWTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dressler.pro;
	spf=pass smtp.mailfrom=dressler.pro;
	dkim=pass header.d=dressler.pro header.i=@dressler.pro header.a=rsa-sha256 header.s=uddkim-202310 header.b=VDEAS7SW;
	arc=none smtp.remote-ip=62.146.106.18
Received: from smtp01-ext2.udag.de (smtp01-ext2.udag.de [62.146.106.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B98606A320
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 03:37:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9B98606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dressler.pro
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dressler.pro
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dressler.pro header.i=@dressler.pro header.a=rsa-sha256 header.s=uddkim-202310 header.b=VDEAS7SW
Received: from machine (unknown [37.228.226.218])
	by smtp01-ext2.udag.de (Postfix) with ESMTPA id 634DFE05E0;
	Sun, 22 Nov 2026 04:37:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dressler.pro;
	s=uddkim-202310; t=1795318625;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kQpednrakk+EZwN9ETI5a7BrP3ajGtGSIYnARNx8U+A=;
	b=VDEAS7SWX396CLG2MuI3eBqC23KFxBQIuDwxadpOV/HX2BnVs+l9SO2WL90A7hpqPnSo64
	KxDeYNt5nnIGoAEW9lUMCXUJCunBecgD1eKwvSIhROILN29DeyX1fgxjOfjNW5prLpmReM
	s+KB2OZDiWy7cKyqh3odI51ZI3BcOEp/+BbL5Q6fQ47XyMwNIF/e7Mw8hOZSeYnk81l7pi
	ARyhL2xw+GLtTyr1zRMMhhGukBvvXX0lyoI6I1HQWCuzdez4AhAC2NORyf8KFyhx+55dqt
	tipjSaldE0Wh0EiE8uIOmQdEabA1Bq0rGD+Al6lbmd3YG/k5Il4UKlj2nqZ5WQ==
Authentication-Results: smtp01-ext2.udag.de;
	auth=pass smtp.auth=dressler-pro-0001 smtp.mailfrom=frank@dressler.pro
From: Frank Dressler <frank@dressler.pro>
To: netdev@vger.kernel.org
Cc: dsahern@kernel.org,
	stephen@networkplumber.org
Subject: [PATCH iproute2-next] ss: build the socket cookie with a single shift
Date: Sun, 22 Nov 2026 03:36:57 +0000
Message-ID: <20261122033657.187703-1-frank@dressler.pro>
X-Mailer: git-send-email 2.56.1
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

The split shift was necessary only while the code used unsigned long.
2e7e805d0aac ("ss: better 32bit support") changed it to unsigned long long.

Signed-off-by: Frank Dressler <frank@dressler.pro>
---
 misc/ss.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/misc/ss.c b/misc/ss.c
index f4160f59b1ea..5107d42ac229 100644
--- a/misc/ss.c
+++ b/misc/ss.c
@@ -795,7 +795,7 @@ next:
 
 static unsigned long long cookie_sk_get(const uint32_t *cookie)
 {
-	return (((unsigned long long)cookie[1] << 31) << 1) | cookie[0];
+	return ((unsigned long long)cookie[1] << 32) | cookie[0];
 }
 
 /* Names indexed by a value from the kernel, which may be out of range */

base-commit: 9eee7bb80f98a0789639ccdb0d68a667962e16d6
-- 
2.56.1


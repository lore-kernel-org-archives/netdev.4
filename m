Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794801346;
	b=LgdJkACU6nHncMwLQU5HJjH9Wt3XoiIy8rkr73mik1SJncJZ9H2yE3BY/GQruPCi0RSD
	 lP/dWrFw0/+baARVoOrrxnom3j7APVu7eqaJKxtNvGKn+TzAsM/CTugartDFSJFN5Jfk0
	 xFGspP2IPH8Rw12l02Hx/7UjuafJiUqyFuC0QEZCEuruOM3/1dahmnEJo2dnzaerdd135
	 zYnIjbCCQsH+rMxP1K4pFnXC7ShEuZBiQtTuKwhz7yb3VAry7O4Qbdqx/+xxGJ84M6xk6
	 bPv9GPV3Q67J4zgCfn57v7GWU2XzfH4dPfLu9fKpVhkeU3fLLf2C0j+emoAoUDIi1wQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794801346;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lPLYXRtdUzVxRMFi5L98tPD8dNCrei+9JW0B4GyCjnE=;
	b=Wja3F/VSFglmw6qo5GdkKImjGzNXJqZlxqUIEAHD9g7ezR1iP4SAXHrxfdc607JtHQ47
	 PFDqulVuYC1U0MHb94Vl4ymPYkt6HVL9fCp+AdiOhVcu8YyJzlZyfqYn66J73pouGQf0X
	 KWVM+k6gnOTFZf+WdtMphL0H4ZmLfUvQ64cDSdxp3LrRYwjfXHo/MhioUZ0HWndP43jR9
	 kP8iW9w/W3XTZkLwU9kyK2O3N6+AW5sCOoN2IC8o4Yb26r48fEf04L8llBfvfdW0V9TuC
	 A6MZISE04WrcrEomX627IP0v6csXy2HEYh8NVieaBmaG3otTfuy2PkFr5gHgk2AMvZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nebusec.ai;
	spf=pass smtp.mailfrom=nebusec.ai;
	dkim=pass header.d=nebusec.ai header.i=@nebusec.ai header.a=rsa-sha256 header.s=google header.b=XloESbbi;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F6C606A31F
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 03:55:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49F6C606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.a=rsa-sha256 header.s=google header.b=XloESbbi
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8b5c3288e6cso1232059b3a.3
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 19:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1794801344; x=1795406144; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lPLYXRtdUzVxRMFi5L98tPD8dNCrei+9JW0B4GyCjnE=;
        b=XloESbbiyA1sWYOnXj9ixs/llQ3B2Q/8hWm/wMQfm1gIt/oHhCgMeNqwamBFahNkuD
         ie8M3VAhhEt6lAuEXjud0jC6LUzy2WxQcydWAKcMc9ke3uvuYeWMM4FKTWCQxBIOAyjS
         qFVhBzDreZ/94uY0+yEvRePqAA6B0as4NQdMW10xFCFdSQ8JHzDrdEzlg4HL6QGDYYz1
         nzB0tY763kk5SoTfgqnMqwIA07FwlnHLmImsYXgfZ3yHGMltZcagXJWrXAXyilJnoRTO
         KtW70orQI+PM+JOghTMbLHtu0CxKiT0mYWDjWYZEfjl6psGngfmDhR5gnNqaUx5veNFK
         K6cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794801344; x=1795406144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lPLYXRtdUzVxRMFi5L98tPD8dNCrei+9JW0B4GyCjnE=;
        b=cNFlZbfYL5GwPC1o+dakGmIbDtL2bKUNW1b38wh2oB6eD8/L//74iD2hlqnFVG46f1
         Eed6Nb8vhGLhmGmufVgD0kEBV64QmrYf1LmioRTR7RnZCGm58wAWaVVUT5TBAAWumiCK
         A+QVeeIiMiSI+flYkOFeJcZGb5ZnSVG4rJaRJURcOP+oHNjSDR+DKK3Ey9pei0ZYMwFO
         7CqRR9qCWn5UPRU5l9GS50yKYwQFRTYx0TCEA8cu8st3imXEW40ii63cBkvLqpLza0LH
         7Si2xYWVx3md7Y/ctOsSw+l3fJITOQIWtaiwAJmyP7Mkj+ZCiA+mcm7IxPHGizqdrfwN
         kUlQ==
X-Gm-Message-State: APuU4Z9cVaddJKth747vZ0e/JgxugcLMZSfGG6qscFQe/NACsWwPBoxQ
	opuDsfMayA4FoDgXA/sLWjXgnXvF2n3fJwXn+k/OMK0AXTPLsXS9x9B+Jq3fN5aznDeTSHPTD12
	X9p+BJZ7w
X-Gm-Gg: AYBFou0a9VQ1s57wb7UV4I5i/B0YRkw5MUWln15VXy905eeaxoWsiMTG3tvCHxKGVfP
	PIGj8aDnjyyWawAeckL7SdafjJjZcKkdgKZSuHufCnkBDaUsJLtDc7iEs9xEPcRHLKrBpQPTwU/
	N+59QmwqJ+pf7rH55jhZ6mZNalJ1mRi9gpIanhHdOjm4xv2fLDDiU5LML/TD9jZ1y7Ympy2pHHV
	o4KFfLn8eUq2MUQGS4LmP732hDs9dk7+eFk6KvJxcbLg3+nICAk2hpj6rhpyGbfXAjT1d2uYChx
	Xzd+4SlMxR1w7DpxKbOFVUlSyiZjQ6pzfms6GvqPW5CyhcEHooJKbZoCYUqSJCRbWCP9EqUEfSM
	h+BwzOVu1+860IWIVwx1D/MdDEwHXeOhOG+3D5EEfjG3Ktbg6WCfayTaiX9k6CJ03WK5/THFUfm
	wRXelCPysEsakVqO8MCktgpiZmbt3x1U3trm+XGim7Dn/47RC7w0zYxRJDpzTguqYi7fmn31WzN
	CDRsRwKfGMCtFbRk5NbwQMTw0hFX9+S3ShkR0Yw7q0wX2/3n/5ZFn634VqkJzBQkNfMIjVUDQ0R
	Hk5vioDbKUcbhmRFXGhw6hmHKdT+czGyXdtibDiSkalw3Dz7or3vxumTXx7H4vWfPiGgWR/eSSj
	TLJwb0L8G/0rvygXJLP99
X-Received: by 2002:a05:6a21:7187:b0:3fb:5fb2:a4f7 with SMTP id adf61e73a8af0-3fb5fb2aa96mr1341727637.34.1794801344555;
        Sun, 15 Nov 2026 19:55:44 -0800 (PST)
Received: from 24c857d0c3be.. ([122.51.212.64])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc1886b12sm3463176a12.11.2026.11.15.19.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 19:55:44 -0800 (PST)
From: Zihan Xi <zihanx@nebusec.ai>
To: netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	bpf@vger.kernel.org
Cc: willemdebruijn.kernel@gmail.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	benh@amazon.com,
	kuniyu@google.com,
	shuah@kernel.org,
	vega@nebusec.ai,
	zihanx@nebusec.ai
Subject: [PATCH net 1/2] udp: fix reuseport rescore fallback
Date: Mon, 16 Nov 2026 03:55:32 +0000
Message-ID: <8c46325c4a433f02fdc7241c0c3884126cb502af.1794759652.git.zihanx@nebusec.ai>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1794759652.git.zihanx@nebusec.ai>
References: <cover.1794759652.git.zihanx@nebusec.ai>
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

When a reuseport group contains connected sockets, UDP lookup rescored the
socket selected by the reuseport program. If that socket did not match the
packet, lookup retained the stale selection while continuing the scan. This
could deliver a packet to a socket connected to a different peer.

Restore the candidate that established the current score when the rescored
socket is not a better match. Keep the selected socket only when its score
is higher, and apply the same logic to IPv4 and IPv6 lookups.

Fixes: efc6b6f6c311 ("udp: Improve load balancing for SO_REUSEPORT.")
Cc: stable@vger.kernel.org
Reported-by: Vega <vega@nebusec.ai>
Link: https://bugtracker.nebusec.ai/f/net/ipv6/udp.c||udp6_lib_lookup2||socket-hijack||m7q
Signed-off-by: Zihan Xi <zihanx@nebusec.ai>
---
 net/ipv4/udp.c | 11 ++++++++---
 net/ipv6/udp.c | 11 ++++++++---
 2 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/net/ipv4/udp.c b/net/ipv4/udp.c
index 2e5562f353f8..23a8c951559c 100644
--- a/net/ipv4/udp.c
+++ b/net/ipv4/udp.c
@@ -475,12 +475,17 @@ static struct sock *udp4_lib_lookup2(const struct net *net,
 rescore:
 		score = compute_score(need_rescore ? result : sk, net, saddr,
 				      sport, daddr, hnum, dif, sdif);
+		if (need_rescore) {
+			if (score > badness)
+				badness = score;
+			else
+				result = sk;
+			continue;
+		}
+
 		if (score > badness) {
 			badness = score;
 
-			if (need_rescore)
-				continue;
-
 			if (sk->sk_state == TCP_ESTABLISHED) {
 				result = sk;
 				continue;
diff --git a/net/ipv6/udp.c b/net/ipv6/udp.c
index 9dcefa162522..c5adeaaf5b42 100644
--- a/net/ipv6/udp.c
+++ b/net/ipv6/udp.c
@@ -234,12 +234,17 @@ static struct sock *udp6_lib_lookup2(const struct net *net,
 rescore:
 		score = compute_score(need_rescore ? result : sk, net, saddr,
 				      sport, daddr, hnum, dif, sdif);
+		if (need_rescore) {
+			if (score > badness)
+				badness = score;
+			else
+				result = sk;
+			continue;
+		}
+
 		if (score > badness) {
 			badness = score;
 
-			if (need_rescore)
-				continue;
-
 			if (sk->sk_state == TCP_ESTABLISHED) {
 				result = sk;
 				continue;
-- 
2.43.0


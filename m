Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794861004;
	b=PrAMc0k+rNKoheBxXvGgOKYFrs/90MyDDhQLW5QSLOvJ//mY3ILIksAtAsKAacs7PTqW
	 lY8s5DONcZ4pJ247HJhuwauHHyIQOU8P4b5enH9gXZNx/Tq6UOd7I833HyRZywsFskHNR
	 WgEpplA/rd93o+6k6rQ5M1Hxq37mj5nX80kECc0573ezk4DnJJoCdND5FhqF1hBTEJB1H
	 ynvdacjdthGs0nlj6R8es2/Y9y7PwYDoSVRRnTV1cmiwa4sQWfl7h203m2S3x6DPrsCHG
	 tCK8xLsoKdcaPm5y7bvCoOjGdidhCnw4KZdxwYF3W4+4GxdJmZO1dghCFm38hY9p0cA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794861004;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bXP5fB7iEgb3+pmDuTZ5h87Io1ott4tRKLUs6vj3GNk=;
	b=olnhTmVsMfPT9Yc+s170ja6+Jlc0OEuud0vnlgl3D0nw2XB9BYpVjEPXVjtRAmtTMxrC
	 210YL+OYF8AK+mT0Tagl967pV46sIIJBq7qAIoFtHP3ciAf1jlLGyTOq9nuklrULzJMbG
	 9PmcMRR1l/9jF5vtHeVzGEIoqOxavQMglfTpzaqddwSRzRkGVlW/ZlvBCDIQWOnW1mfUD
	 sjxIsvZZzTnp4BBl1cicvlsvnX2rG9ajLIP1VW7tbMyUeSW5aNgsrBFYZ/FBcrRBzPyS9
	 O10VgB4McsH4VgeZNB/qwTTV7syGB57tKvhbe7jZo+G7pLzetzEdG+47rJ+0kDX7TqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eVHfch3V;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9F5606A886
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 20:30:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B9F5606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eVHfch3V
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc758830601so3663724a12.2
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 12:30:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794861003; x=1795465803; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bXP5fB7iEgb3+pmDuTZ5h87Io1ott4tRKLUs6vj3GNk=;
        b=eVHfch3VrdJWVOhAWrLiAtCKfEsfxVRew47clyeotqrS4Q2v6/7OS7vvygw9gnvikL
         WNzvdTr/qR77/UgjMiaj8PAsiL4tmev82scg5t3Igbie2Ik3SqYGGf1EhhppX0h6HXV9
         GmuMeYAe9O4Wha7WsCjSQfCATQ4QyBsVAD30vwMeuwS5QVcMvH3jgG7lFHDG7qtTMgSZ
         hReHsIcuF7Fl9Mx0FGTuClY16vMb2ZSsMCPkMSRsJpmCcoR+kqs+SIW6g/SYArKnQo/4
         hvqMEhIQZDromaQ1xPyfKAqSNaSsVjLmNWTuKUWZ2rSJ8Xyuh8GiTGzdJGS5034NFKCu
         kN9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794861003; x=1795465803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bXP5fB7iEgb3+pmDuTZ5h87Io1ott4tRKLUs6vj3GNk=;
        b=D6P9VsIQG7YUghOE50W4W4WF2QZIXNLCVI2wmltYAH+rKFdjSxhUAoXsa3y6I2c7LM
         Ql3lwljDItYuvPxHlpJmmrIZjwHxC71ACBm3XTTbxyWjL59aJqO7j+sNKsN+kxXQSnkm
         UaRcXFoR2rLMNKGf4jqlqixmYG7NKDFIePmtyM/BGWTKazLUUi/pm+KYrXGRNm1PFKFk
         XvPDV3Kmk7R/FvhRu8d7kyAI1+fGXH91YUefshV1aJoDtHMnn2wxbJsVuYsf9ZrDCMbo
         f2HfBtvzx+NaqCOv7KzLTCTZSGHqwCgpvXwRfJD0beKJWLWcTPuzXuPqeBXqwBqFRV5Q
         z/SA==
X-Forwarded-Encrypted: i=1; AL+hErEJCDLDcV5sL5GdoXdO4x8otp8gdY0Vb8gFhMg1VNmCfgtvA2DoMKJ+6pSM0Uu9WhFtiTwxU6s=@vger.kernel.org
X-Gm-Message-State: APuU4Z9SG8ILGmbPGyoSZaEwNysgjEKeAot7BNhW8BJRJE1zY1ouFWJB
	KwG6qVNbcLQ1tbM0A33m+G6TOlpkBd1GHJZXCfbRoq7EOEbwF0EZvPylem/C9Q==
X-Gm-Gg: AZFdTZfK9fTQZ+YRuH67y6tITS40tVv8kmwXNF85AHs/2JfouzC9TGXeiRh+qSpJqUi
	/h21UU8AgI6pcKIrW/Kf9P0g2zsfHjUXfaDSDd1VPU86E7/4lJcRiXNOiN4B0nbnnqyFEq4x0wE
	XFJHUKZhuoYS3zo7LFqjSSClW0we/FybrfSUsZYTRwogWmAALVMS1YdtD8aPggYLG0KTL8iJkMF
	xsx0WtzlKPzVy+BgTXlyRwyblK7hCf+eIKH8eT5fYdHxaPmpkdqTdyZvWOFLTLRGv4nUPi55AIj
	8hP/CD0o0vCL4vDvKrkrcbvF7ahwvn8/i0AqJC31bA3WoatSBPd5PZlzQ4WLcQZIZHDm6OG0vvG
	dBt4DQdO4kXckeA5OmBaM9RTPywIAnIit/NGrTnapfv7KO86AQoeiF1xY/VZJwqSw08hPAf5haS
	xAthD6hVDmUcFoHbuTqKzfIK1g6uTiwt6KwyNr4AUabMTiI2JG2tvTbcWdJmVHW94SARkUBFp6H
	AttaCFkLXGYt7hhqHIjM3qgd2WEyxkBZ91J4QBwV33TqIxw2QPOQJPG55ahaBQhiblKhjeUtE2P
	Q4AuOX0fpQnCteVzwxyiRVwXuqsBQsNco1X/
X-Received: by 2002:a17:90b:1dc8:b0:3b1:12ba:867e with SMTP id 98e67ed59e1d1-3b1b0b5b550mr12249803a91.13.1794861003214;
        Mon, 16 Nov 2026 12:30:03 -0800 (PST)
Received: from localhost ([2a03:2880:7ff:5d::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac2cca15sm627557a91.11.2026.11.16.12.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:30:02 -0800 (PST)
From: Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
To: "David S. Miller" <davem@davemloft.net>
Cc: Alexander Duyck <alexanderduyck@fb.com>,
	Jakub Kicinski <kuba@kernel.org>,
	kernel-team@meta.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Mohsin Bashir <hmohsin@meta.com>,
	"Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Bobby Eshleman <bobbyeshleman@meta.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	Simon Horman <horms@kernel.org>,
	Mina Almasry <almasrymina@google.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Dimitri Daskalakis <daskald@meta.com>,
	netdev@vger.kernel.org,
	Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
Subject: [PATCH net 4/4] selftests: drv-net: stats: query timestamping stats while down
Date: Mon, 16 Nov 2026 12:29:57 -0800
Message-ID: <20261116202957.3601684-5-dimitri.daskalakis1@gmail.com>
X-Mailer: git-send-email 2.52.1
In-Reply-To: <20261116202957.3601684-1-dimitri.daskalakis1@gmail.com>
References: <20261116202957.3601684-1-dimitri.daskalakis1@gmail.com>
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

From: Dimitri Daskalakis <daskald@meta.com>

Read timestamping statistics before and after ifdown, to catch drivers
that crash or reset them while the interface is down.

Signed-off-by: Dimitri Daskalakis <daskald@meta.com>
---
 tools/testing/selftests/drivers/net/stats.py | 25 +++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/drivers/net/stats.py b/tools/testing/selftests/drivers/net/stats.py
index b08e4d48b15c..e61db30b5181 100755
--- a/tools/testing/selftests/drivers/net/stats.py
+++ b/tools/testing/selftests/drivers/net/stats.py
@@ -220,6 +220,28 @@ def check_down(cfg) -> None:
     netfam.qstats_get({"ifindex": cfg.ifindex, "scope": "queue"}, dump=True)
 
 
+@ksft_disruptive
+def check_down_ts_stats(cfg) -> None:
+    """Test timestamping stats are not impacted by ifdown"""
+
+    req = {"header": {"dev-index": cfg.ifindex, "flags": {"stats"}}}
+    try:
+        stats = ethnl.tsinfo_get(req).get("stats")
+    except NlError as e:
+        if e.error == errno.EOPNOTSUPP:
+            raise KsftSkipEx("timestamping not supported by the device") from e
+        raise
+    if not stats:
+        raise KsftSkipEx("timestamping stats not supported by the device")
+
+    ip(f"link set dev {cfg.dev['ifname']} down")
+    defer(ip, f"link set dev {cfg.dev['ifname']} up")
+
+    stats2 = ethnl.tsinfo_get(req).get("stats", {})
+    for k in stats:
+        ksft_ge(stats2[k], stats[k], comment=f"{k} went backwards on device down")
+
+
 def __run_inf_loop(body):
     body = body.strip()
     if body[-1] != ';':
@@ -311,7 +333,8 @@ def main() -> None:
 
     with NetDrvEnv(__file__, queue_count=100) as cfg:
         ksft_run([check_pause, check_fec, check_fec_hist, pkt_byte_sum,
-		  qstat_by_ifindex, check_down, procfs_hammer,
+		  qstat_by_ifindex, check_down, check_down_ts_stats,
+		  procfs_hammer,
 		  procfs_downup_hammer],
                  args=(cfg, ))
     ksft_exit()
-- 
2.52.1


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794952468;
	b=QoQIKkExIjOfFcRitJ9hEM/mx8kLohJIPAozKKtMTq0YQBxTcVHFQxMiXXWDIgA4nm3b
	 2miW7BI1XbXW2TZF0ejs4hzeBP5LHPwcKAubuvPVozEIX8QXhnsZ+GL/69suXif04dbgj
	 gbaYAHvJAHCX3T6hPaouid7lnED+X878+Hp/KJAq9zZdabFen0cm2Rovz1ncnWTQbXE1u
	 4dzQj9tO5oVxO3wHUUbjiYc+78XN7iZ8AAGFmVPtWO96FAu7FThdu5gKf3P2jlUfoMCdW
	 VKmv5wiHL+wAEBXWe3fRDkDOg2+V0AKLd50Il59KMeSpVf1UJii7FYKSelX2E5M7Ipg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794952468;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RDV1bx3ja+YvNrLezba1SlDO8efyEXdMeRFf74ipHOo=;
	b=sOGJfGT27X6qwwVJEGaLInPFMjKM9QY5tAQ8re82Pwvrgu/U5bXbviumc7D9GDRzkqhU
	 YjYk5Q66LEibit0ARhbI9u9UxBDivzjaSFNVJAJPNn05QsKjEpFd1piM3UAQCZetyOo9g
	 2JZti4o2qiYilEJD1gyVgepAzHWZ8Ac3dDw2O3wfDkwm+ZHr0a/lcuwZhAg5mzbRElEiD
	 PBZWhnl1Wd6POlzYW6A5WSbWU7/Sa/EM++Bce+f5h4fXIYGfdnCsXoWFB69MuOPhBxLn3
	 2quftsZUzeRGcmEbVqK2y/ySHmqwt4qhiI+vr/G7m4biexWHOPF0EUkera4MpxWMKBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=axpocuFl;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163FE606A336
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 21:54:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 163FE606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=axpocuFl
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-ccca948203aso207693a12.3
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 13:54:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794952467; x=1795557267; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RDV1bx3ja+YvNrLezba1SlDO8efyEXdMeRFf74ipHOo=;
        b=axpocuFl80FvAB6K0rZxxboDLtcNggcPKNN2UKlsVtFpwW/YpEM8wRJS7iMsxv0ACR
         Yi0bS/ixM2TrOygocp/SAafyE0mM4l+8EY3rVIQyYo6Nro1zs8+2Vy0/7XK6kWI7PtFy
         r5yXn1ugRgzHH40jFnzDVPt4puK3Ywa2mZR78n9m8q2SxXbN0XFAK6Z6sdX9WUSb4i5x
         JqXDA4qc62SY+flHQtqb95ZbhWe5R00nawnX6JgDwa8Bx9IfO3FhHT0VNsBwcqgnGZAm
         zo3MV0RBsD45xyWQZMMW57Hnphg7zudRqxg550FBQKIksQZNaHx98S+PodV/xuAa4yhm
         Yq0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794952467; x=1795557267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RDV1bx3ja+YvNrLezba1SlDO8efyEXdMeRFf74ipHOo=;
        b=BfgjeHGLPrut5d2T24yCNYJ8Xc4693bx7SI+WIe5CfJP7LAlQRgYUUWSNVQKhJVlyZ
         luzfrzYm9/Vm9LRTjta3TvYOK6i3tMkzw9Z8i9vc7/qN7IlnvCGY1Za4I7Dxw6Yrzdex
         XrEJogpb+kKu3e932het5X6s5a2E6qfFkdcY0Rg6DsT8N7tMomCph5pWhmgKtL03I8WL
         n+qGqZoJ88Rl3b5KKP5K80AG7CXsfmDv82PAYHzUgGSlkhYSJxuryhLdSaZIe2W7gPCZ
         zGid8H4cW1W1dZ7QujyxQF0BcgnnpERZW/549Z8Q3nqwX308rMT4BAHkOGemccusf3Jb
         5c+Q==
X-Forwarded-Encrypted: i=1; AL+hErGM0JPafPL7+4pf8eQAQEMKWw4JuUU98P41tMD6RAHOqR8VcbuaWDFfv4bvZrep/BGXOJ/LG14=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2V8AzOu2zGzdz2LZoC0dDXso5nE2a/dPoEeEIqWyzMohBK1qb
	49I48Y57hsKs1DSoU97dRql22S0b7ljo2VP8oXltrk1fE1IGhamzPg0+
X-Gm-Gg: AZFdTZfclAP0NYQiGOH8YBc6TQjyU1iUMT4YbP3erKYzmjqWIPolix+SKquP4+VVZnG
	lZraV8VY3xqiFgRVKe4Ptsqo5A1s7Hkec00cG9EyFQvk6m4mbirRTjWodFWbx3yj7v4eZQ83o4X
	kcG51P3Xz3L4b8BkLoQaHLcsBKs1T8P0J/ceViS5UZe0Lm830X2Ge1fjThxKHJHZMoulesnRj3Y
	L3GgqhvPPRrJUAE1x0jbz9BLC6NjRw5lsMktub4WrJHj5OgLmgVe2jO0z42e7Ttl2VxrQSNjfhQ
	RsugSKZm4jO83F+qhkl+bpxOR1H2gvrISy6ZIKcSeU4cbIGkJPOhhb2+MWiOVuGJS8UNkUb03SR
	ei8BzB61+XJ8TLypM62GCrad1PL9ZyxHKoH/ZKLL/d+oslBvyXwmoe/pbUiMGTHqgFQmIftep/S
	0OQ+fVRWm7c6CS5OboUWS+9A6JAS5Dj8aEZPanMoNX/wLtrQkr1RI/nbstnqrdS/UFGdXAJQsrm
	yoFc7xg9MUT4uHz1KB0thyoZ5pA5xg52E9QHgPE+dpEMrwr8paNQhvgn7QO/FJvqPB7PStjV+w7
	cSrmTs+0Zw5T2+H09lXiUyhG24Ia7A44M1Q=
X-Received: by 2002:a17:90a:d445:b0:3ac:8897:7bab with SMTP id 98e67ed59e1d1-3b3d0686792mr575601a91.6.1794952467348;
        Tue, 17 Nov 2026 13:54:27 -0800 (PST)
Received: from localhost ([2a03:2880:7ff:55::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d1acd118sm727075a91.12.2026.11.17.13.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 13:54:26 -0800 (PST)
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
	linux-kselftest@vger.kernel.org,
	Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
Subject: [PATCH net v2 5/5] selftests: drv-net: stats: query timestamping stats while down
Date: Tue, 17 Nov 2026 13:54:16 -0800
Message-ID: <20261117215416.1901246-6-dimitri.daskalakis1@gmail.com>
X-Mailer: git-send-email 2.52.1
In-Reply-To: <20261117215416.1901246-1-dimitri.daskalakis1@gmail.com>
References: <20261117215416.1901246-1-dimitri.daskalakis1@gmail.com>
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
that crash while the interface is down. Counters must not go backwards
across ifdown; the test does not send timestamped traffic, so a reset
is only caught if the counters were already nonzero.

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


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795455685;
	b=hx0Dh9Rjwo8ATcMwhyNV22wcYjAAwng7/paLveuPJGxFkgcQZsN7NW3K9ZhcIre6hZCy
	 KZZv3+7ZqkV68mURCEvGPNzxftXA+8Ud1eGAH+SEAsQwmqez8sTSaDhmCsrN4Cwj83Bjv
	 u3NwNoGNL2KjXSlJY6zCv8Uh6WHZa/KcBmfPwwgoAeA2IZgqF0np1tsjGuNcWarCefdZI
	 wdPnlbwA7i609kSkP4ZePYT4kmOU7QOL6l1MaBQbNYTmM9k0OdRf8i/+i7sT4DuMSix7m
	 BVaWyS8SRQzAWy+4oF8yMrc7GIJtwJtoIsxUEHSkvRaGjBIDPm1kgIpNmKrzMJijlsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795455685;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=50tBgP9EvHiJ3pXlg5LOwuoWYl1wXAWy7E4OUGAPpUo=;
	b=qvp7VEq/ElOBDoKx0Sd8+DPBTgaGohnbSxioBikIiQ95ayrBDhP7S1uic4Q4Y+F4Y9J+
	 vA2uskdu6wSKXWZC17FB5bkBJ4BWUDZafJsCQtGyUXFOKTWd31kAB0vZsle1vzprA/4LW
	 sc/+XZjsSvglYngsWzf6e3tYVAiyulSPp8ddjk46L677tVpa2nX1mhV6KQP3FXwQpdeyG
	 ublzvRu3Cgs4MYKFXMnuxIVv8f9c28w63irZ9Jwqld5V9Q4v/ZPJ4WNSG24lO+dESo+JG
	 kHCljopMYbF8BTeYneyOmF4mzrIoQvhhzKmzc5b6MviuH3NYvwP7JQftBOHAlactcNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DA8EmNEv;
	arc=none smtp.remote-ip=74.125.229.8
Received: from mail-dy2-f8.google.com (mail-dy2-f8.google.com [74.125.229.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F17C3606A32C
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 17:41:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F17C3606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DA8EmNEv
Received: by mail-dy2-f8.google.com with SMTP id 5a478bee46e88-382afece6d8so662304eec.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 09:41:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795455684; x=1796060484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=50tBgP9EvHiJ3pXlg5LOwuoWYl1wXAWy7E4OUGAPpUo=;
        b=DA8EmNEv4flhrEi/S2hMVLxldZNW7hwJspGI+CNKh4tXAhVhH5kdf2fpn+2YH9jSgI
         u47ZjUdr3TF0FvNfgKUNncq7qLB/U7Fp9T8/I1M0ukqkllMnT4ofEnR6eIupz/TUnUJ7
         QsR2uOrGb8pqt3L0vxzzLQ1o0qI5Vc9rBi1U+DRFRFck/32jBP+m5k4fa6ZmAjbMTq9R
         expxFIE5JlsbloPp969d2v+qgH+2tEJiz3lWe6eNJbmKy2SvTCVHDzxzVgA135FOlmy2
         tZuMxYd4ZCYe55Ln33UcJ2qyMiZ01uMUZwOaggZoUfRXItMwlFkk51W5ytFTewsjCbfp
         D/TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795455684; x=1796060484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=50tBgP9EvHiJ3pXlg5LOwuoWYl1wXAWy7E4OUGAPpUo=;
        b=l3G87UXiWcQxLZzDDoe0NftWL3zP8UHI2mO6TYOFApc6CXoE7JE98zwD3olyFRglHT
         z0/nxk3r6UNkmcErP79UrrhO+HMlzW5X1WzTPJUjPHwUfAXmDpcMbK2/1V3CczNAv7CK
         H6raWUj+oPzxEN/08rQNEDLYLU/Zi23yXG279szxveT4mCF6FHSXCdrHqtXg+V3HKNJQ
         vj8CJ4tvAa0Yxas16iWt143Fq9N3GpM13472aRJ4iwc1dDjimJWx6zPge7uHc7XCrtRT
         G3+3xwOznUESWn6jGV/0m9dZ/tuaVbY+w4P0f4VCdzTMp923UOgZJKzc7YppHtzOdNSg
         4HyA==
X-Gm-Message-State: APuU4Z+bIkM57GhOIsRwoRQ8wj0KQb+3TnrIqA8+ZX3UyJzUR60XIKFq
	w5mAbmyoZPVcLFgBElKyDCkgmNGw/UypGNJjjmWedA9+ON7MUtSKRBx4GAP0nJrNDbc=
X-Gm-Gg: AZFdTZfe09LxEzPdrgSL3Bu97mUfCN9GQZ5aGbbKNaF6iGCf9oOAHXrVxs43UTx5GCe
	qfoKH5TQlsq6rpO6ViwQk802iCMJj04pwgkNUfzP1trSsvFfq70iql03L8gFx7oWkBHs4RBEh9V
	YVXpphSHLcxLt3UDjVA6pLv1P1CkwCc5HtTzfRRcEbuhCK+v7OH0RptxxQmrC4wHmr5rHsh0OPY
	F0Nd2GFoZGMMac+eGVtKPoDPj/HTPMyUXx2lTb2vZfOqSKypW549zJTpywKsTCqiN2+nDTmTbeP
	TAJM6CD9+d/jKX3OI4WW9JGeDKg8kTOXjVjjkVs5gPkDVrfelkd2vQ0z+/TK+MwbBckILEaElbO
	wv7ke+67MGSfvQdT3fWqQ69bcYLr0kMilTxuheAkCUKx/tsywRdjeBnPvEsCtJKSg8AdD2BGgZH
	WWOqRutKU9ENob+SNMGps/2/xmKrvnbX1WkIiYWuzu52vDfsPeaEM1J8vXrH+8rDSmkTxwiaFkO
	Q75I8Ziq6bBxGt1+ZZmL54yIzSZZh8JvxMwE3zwPu9NV8n95E6Ff/6W53kC4k9M29PLZs1ppNe8
	2WK2YXJ1tc43I7EeW5eLG1mkukiZKix4MBuJRCtnLnAs
X-Received: by 2002:a05:7301:1884:b0:374:ba43:ae2e with SMTP id 5a478bee46e88-3856f65eccamr11660323eec.14.1795455683989;
        Mon, 23 Nov 2026 09:41:23 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:70::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385f68bc0adsm34269184eec.13.2026.11.23.09.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 09:41:23 -0800 (PST)
From: Stanislav Fomichev <sdf.kernel@gmail.com>
X-Google-Original-From: Stanislav Fomichev <sdf@fomichev.me>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Subject: [PATCH net-next 1/4] selftests: drv-net: kperf: support request-response tests
Date: Mon, 23 Nov 2026 09:41:17 -0800
Message-ID: <20261123174120.505808-2-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.1
In-Reply-To: <20261123174120.505808-1-sdf@fomichev.me>
References: <20261123174120.505808-1-sdf@fomichev.me>
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

Let KperfResult tell the rate of the transactions of request-response
tests and, when the client is asked for them with --time-stats 2, their
latency percentiles and maximum, as seen by the source, which sends the
requests. Request-response tests run a single flow; of more, the first
one is kept.

Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
---
 .../selftests/drivers/net/lib/py/kperf.py     | 31 +++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/lib/py/kperf.py b/tools/testing/selftests/drivers/net/lib/py/kperf.py
index 8ee8c5ba2ff7..98d27d83dee2 100644
--- a/tools/testing/selftests/drivers/net/lib/py/kperf.py
+++ b/tools/testing/selftests/drivers/net/lib/py/kperf.py
@@ -7,20 +7,35 @@ import shlex
 import subprocess
 import uuid
 from dataclasses import dataclass
+from typing import Optional
 
 from lib.py import cmd, ksft_pr, rand_port, wait_port_listen
 
 
 _SECTION_RE = re.compile(r"==\s+(Source|Target)\b")
 _RATE_RE = re.compile(r"\b(Tx|Rx)\s*([0-9]+(?:\.[0-9]+)?)\s+Gbps\b")
+_RPS_RE = re.compile(r"\b([0-9]+(?:\.[0-9]+)?) RPS\b")
+_LAT_RE = re.compile(
+    r"\b(p25|p50|p90|p99|p999|p9999|max):([0-9]+(?:\.[0-9]+)?)us\b")
 
 
 @dataclass
 class KperfResult:
-    """Aggregate throughput (Gbps) of both endpoints."""
+    """Aggregate throughput (Gbps) of both endpoints. Request-response tests
+    also tell the rate (per second) of the source, which sends the requests,
+    and with --time-stats 2 its latencies (usec).
+    """
 
     source_throughput: float
     target_throughput: float
+    rate: Optional[float] = None
+    p25: Optional[float] = None
+    p50: Optional[float] = None
+    p90: Optional[float] = None
+    p99: Optional[float] = None
+    p999: Optional[float] = None
+    p9999: Optional[float] = None
+    lat_max: Optional[float] = None
 
 
 class KperfRunner:
@@ -133,6 +148,7 @@ _RATE_RE = re.compile(r"\b(Tx|Rx)\s*([0-9]+(?:\.[0-9]+)?)\s+Gbps\b")
     def parse(output):
         """Parse human-readable kperf client output."""
         throughput = {"Source": [], "Target": []}
+        rr = {}
         section = None
 
         for line in output.splitlines():
@@ -149,9 +165,20 @@ _RATE_RE = re.compile(r"\b(Tx|Rx)\s*([0-9]+(?:\.[0-9]+)?)\s+Gbps\b")
                 if (section, direction) in (("Source", "Tx"),
                                              ("Target", "Rx")):
                     throughput[section].append(float(value))
+            if section != "Source":
+                continue
+
+            # Request-response tests run a single flow, take the first one
+            # and ignore the rest
+            match = _RPS_RE.search(line)
+            if match:
+                rr.setdefault("rate", float(match.group(1)))
+            for name, value in _LAT_RE.findall(line):
+                key = "lat_max" if name == "max" else name
+                rr.setdefault(key, float(value))
 
         if not all(throughput.values()):
             raise ValueError("incomplete kperf result")
 
         return KperfResult(sum(throughput["Source"]),
-                           sum(throughput["Target"]))
+                           sum(throughput["Target"]), **rr)
-- 
2.53.1-Meta


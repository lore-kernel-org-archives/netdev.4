Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795455686;
	b=s6CWAINeEuBhW93cxbc9Xx+oUmmH5Tl2KQpSa2oSoOvRTMWoqhjr7VaKZl1pQSlMMmmV
	 +7pmu5AjiMvUhP3X37rSZMD1pMk0074gSGCEFsdcUZZW9c+TPIe+wJ3Botl8f2/wgMC/h
	 w0q6X5sBLVXOnT5T4anp4gsBqOlK5OibfwS4Idm1sXouZCoAkMGIMw7hRLh+vllpV9qSc
	 n9eu0Nu+8y4XR8IXpqbuFecpaEY8ccvd1xGRt+kD2MsoB82H/nOVdhu9+/F3XXy48neTQ
	 sPvl7qDmqyhh7B+fCzbgU+fpTGY6OnMSnEJdPMA++WwKXK1fnovDDHGDbYZjaQQG0nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795455686;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=3ZHAh6xRNVY71drSAQ4x4OY76B0dZe+k1rQGV+TrgVc=;
	b=SUyls8+WUrqA5symtPRg01wUxFzbQ6X43jo5H/tuj8ZSITriPk+cwiVdw9xCoPNug1ol
	 8RlOUd4yuWUbF+YyzYz4MIqwAbvjGPzzNO1oO/9QF5YNO9b2MXpPYR3Vd/RrpgET1k31E
	 epVOMnxuBEGWV4SbAYS21hhtlSth/Qg+CsGDl9YugxiARfyrlOhxMkuHnnM1YpVNrUl7e
	 Sca0ewztFGvxmldsnjqhz0tmX4AOrQ8/wB1N7TrC5YWE0xsvlDEAdREfoMfiZfHKuISyJ
	 44hCpB9JZkby1SAy0wV5aRVxkc+nHqRVdHM0DXzSW7blFZuNMMVML/WkmpTuWtQamuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DZGkpPDz;
	arc=none smtp.remote-ip=74.125.229.137
Received: from mail-dl2-f9.google.com (mail-dl2-f9.google.com [74.125.229.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0BA606A32A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 17:41:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D0BA606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DZGkpPDz
Received: by mail-dl2-f9.google.com with SMTP id a92af1059eb24-1397ad3d891so437523c88.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 09:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795455685; x=1796060485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3ZHAh6xRNVY71drSAQ4x4OY76B0dZe+k1rQGV+TrgVc=;
        b=DZGkpPDzO5K4Kr9cojihF7LPdiyg7XvqHbfIfC2s8YwU9uu7kcRk7/UlPW6hAfywQI
         zX6o185eKq22ar0N/GMCYiJYjVMqwUkj5OQX5bxs6Jov6Mgl0VgTzBlvarlNqojawCxv
         zPbLLsFOczYovvsDUgPXn7gGo4KnqLTd03Y22ls43Wl69oE0dMdbJHu4enL9ODv1KStl
         wyjFM6oSi6JbB21bOaevhBXMIyaI0tSDGutFCxHNAA6v11npG34rZo0OOUIF7efiVdag
         jOuEc6bjePcO6GZNdaAehpbxnq1FO7PlrPuJ+XD7p0Au9vyPb+RJOtrKmR4EQX96lAlV
         gEaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795455685; x=1796060485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3ZHAh6xRNVY71drSAQ4x4OY76B0dZe+k1rQGV+TrgVc=;
        b=bpyCpwm9dkHZN3sIb+sqtyijgwk4eHHg7fAS3d0F2VO4nPydMew1UqzyREZS9EC7zI
         EWP8UvOwm4uBgsmvpRzcKkMmu7EKR40qwRvnTHSs68hRiT11VuzVuNLlzDmoF8+A6TS6
         NRfQkv0iZEwNpYId7pxup1GAyYs5ncds1egMNc2d4ulVp6LFYlmFCEfHD+PcteFWd2mS
         uym4jgkG25ArJpM/t9JwYgOuOWUUFmO4A3nb+L2gq0//Hyh5YvnXRzQ3T7+e4RAd3fCl
         oQjrmkKh72jp3ZLPbVP/Q7VtosOF0A+8eW6OJxwwlA2Wok04nNKJTPNgsevpHLFObYc3
         OOHw==
X-Gm-Message-State: APuU4Z9CDK5R6bBl8YZIjnw+YOr6GQFzc4olI7jt3dTKMRAn8nZhL++c
	darL/bzin5bQB5CzfOdpdJbg75pEQKrd5FuK4J7vmmJvx3+iUoVDKOFf9ScBc/xK1Ys=
X-Gm-Gg: AZFdTZdeds33eBICkUHip0EDwS8iY1Bhn3KWVR7hMwbnscFKk2/f4knQJ28Q7iDVP+T
	O+g18CV+EGJJKs9JEswSTpRMNAriRFcSOY23xCNxgRv6V7OaiejXEt/bDr4IIf+0woLxCM2mdNM
	WALCfVpMM6+nlc4TnrxvtvPjhuqc7/BhIR+/PhxJrvTTy4Vu+FmQlLKToTwtuBNEXEEVa/fQU3H
	Hfz6yjPSwmgrJI2GnF4xHrLILwdR9DlUpWuSz5JmygdG1Lrle8TC05IyN7LTIs4TR/wGoJFvYW/
	eusuD+A5bZ4XxY+zmxxvUN+IYzqcaBH3qBQjWuTUBZjWth5RQkqXcEVfA+617qUy5ohxUVIcwnt
	/bYikxOkEldTgj/PXSidXm7xfaQ5M4eUnuDTTRxwFlskyqRj4vFoucmYPeOmVGrD8OTvG+T+2bm
	8fxML7Bx5PHKOKQq7xPzLh0Z4ulWL9N2Z/0tFK3c4Fz1wfw6O/gFdUKPVjVYNwEOIQqf3TN4NNT
	lzaIeBNnnF0VX3T6gB78HvuqYTbRBxMYYWvgJu6HzqLacGPrM6nPlwAGkvQcMS/O8pBoUlLtGeF
	yu/hBrW7uaRUepbbqz9z06U=
X-Received: by 2002:a05:701a:8457:20b0:1b2:42e3:e5f0 with SMTP id a92af1059eb24-1b55689edb4mr11574246c88.12.1795455685128;
        Mon, 23 Nov 2026 09:41:25 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:69::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ffa8csm34288541c88.7.2026.11.23.09.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 09:41:24 -0800 (PST)
From: Stanislav Fomichev <sdf.kernel@gmail.com>
X-Google-Original-From: Stanislav Fomichev <sdf@fomichev.me>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Subject: [PATCH net-next 2/4] selftests: drv-net: add a closed-loop request-response test
Date: Mon, 23 Nov 2026 09:41:18 -0800
Message-ID: <20261123174120.505808-3-sdf@fomichev.me>
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

Add rr.py, which measures back-to-back transactions of a kilobyte each
way, which fits in a 1500 byte MTU, over one connection with kperf, and
reports their rate and the latency percentiles and maximum which kperf
reports.

Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
---
 .../selftests/drivers/net/perf/Makefile       |  1 +
 .../testing/selftests/drivers/net/perf/rr.py  | 47 +++++++++++++++++++
 2 files changed, 48 insertions(+)
 create mode 100755 tools/testing/selftests/drivers/net/perf/rr.py

diff --git a/tools/testing/selftests/drivers/net/perf/Makefile b/tools/testing/selftests/drivers/net/perf/Makefile
index 1a90537d2726..91feb0d62a7b 100644
--- a/tools/testing/selftests/drivers/net/perf/Makefile
+++ b/tools/testing/selftests/drivers/net/perf/Makefile
@@ -3,6 +3,7 @@
 TEST_PROGS := \
 	devmem.py \
 	iperf.py \
+	rr.py \
 # end of TEST_PROGS
 
 TEST_INCLUDES := \
diff --git a/tools/testing/selftests/drivers/net/perf/rr.py b/tools/testing/selftests/drivers/net/perf/rr.py
new file mode 100755
index 000000000000..1dff0c476390
--- /dev/null
+++ b/tools/testing/selftests/drivers/net/perf/rr.py
@@ -0,0 +1,47 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+
+"""Measure TCP request-response performance with kperf."""
+
+from lib.py import KperfRunner, NetDrvEpEnv, ksft_exit, ksft_metric, ksft_run
+
+
+# One connection, a kilobyte each way, which fits in a 1500 byte MTU, and
+# latency percentiles
+RR_ARGS = [
+    "--time", "10",
+    "--warmup", "100",
+    "--num-connections", "1",
+    "--req-size", "1024",
+    "--resp-size", "1024",
+    "--time-stats", "2",
+    "--validate", "no",
+]
+
+
+def _report(result) -> None:
+    ksft_metric("rate", result.rate, goal="higher")
+    ksft_metric("latency_p25", result.p25, goal="lower")
+    ksft_metric("latency_p50", result.p50, goal="lower")
+    ksft_metric("latency_p90", result.p90, goal="lower")
+    ksft_metric("latency_p99", result.p99, goal="lower")
+    ksft_metric("latency_p999", result.p999, goal="lower")
+    ksft_metric("latency_p9999", result.p9999, goal="lower")
+    ksft_metric("latency_max", result.lat_max, goal="lower")
+
+
+def closed_loop(cfg) -> None:
+    """Measure back-to-back transactions."""
+    with KperfRunner(cfg) as runner:
+        _report(runner.run(RR_ARGS))
+
+
+def main() -> None:
+    """Run the request-response performance tests."""
+    with NetDrvEpEnv(__file__, nsim_test=False) as cfg:
+        ksft_run([closed_loop], args=(cfg,))
+    ksft_exit()
+
+
+if __name__ == "__main__":
+    main()
-- 
2.53.1-Meta


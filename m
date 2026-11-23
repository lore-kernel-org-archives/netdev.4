Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795455689;
	b=0H42Ajeh4w5Fpm+IUgmfixIwT6ev79VkNwdlfBy77O1tejPPNDALvXL+KumJ9pPl4nFK
	 2okzgmc2SrcU4WmvHuwJT41KAUkluYCg2JWDRZF1FoyA3RrA9VnUhnaocbX7rcJTNo3eg
	 RCvjLXyBX7OP3g7nROY8+fcBvVBl69YXMm2KxVlPV+OZULrjcQg3ru5QFyCEYujyh42Po
	 J2kImbAxjeXgf2PF10qg3Mq+pLk11Z4uhHNg6KRLW64G0jwXFMWSdcioLFmGKaBaj8D+Z
	 lwSFsN8349SNiX7AeS9ysyezOlE9GnHWYlEQaTZfVMoRmZlua6Ync7mJaEw4AMV9utQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795455689;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=lshIRC0wDHTRV5DO4BvbFpgIVDRNFqrWH/KZR1El2a4=;
	b=X7C83Tpk7eWSPaWwsyGxJpDY6FAdkytkcKJ8bKRlHJ8Em03b44xZwMLiG4CkQyfjEsOS
	 3Xbys3wSIANB0KM8FKOIR+NraIYwx2pcr/WCWjAWDB0+/sTHjYEkUew4vZU2pw5kWdys7
	 8NHOEStW5e5cbNpf49PG/OhtqMZVQLcqx5s3GQv27Yw3A5Jli+zgSQyqxyZhCf/UtGfoJ
	 hXLhaq/rjTctRFoQukiG7aPeKjV8kKuDDowEGsRhY35AmmvopQDpAi3CEMfYYlZZSCs0H
	 yb3fzxoQ9d458otMz/i15F76NVekAVP4uNV42kwExTP7uHyDKlSl3N9T6euF6iLbtOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fB6tiaaD;
	arc=none smtp.remote-ip=74.125.229.8
Received: from mail-dy2-f8.google.com (mail-dy2-f8.google.com [74.125.229.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41930606A31E
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 17:41:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41930606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fB6tiaaD
Received: by mail-dy2-f8.google.com with SMTP id 5a478bee46e88-382afece6d8so662328eec.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 09:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795455688; x=1796060488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lshIRC0wDHTRV5DO4BvbFpgIVDRNFqrWH/KZR1El2a4=;
        b=fB6tiaaDfqwRP3NaaacBWZ9ZpcKN77z+yRf//lUVgkXgCs5IfON/HBlh9kix3OWYcj
         GmZggzjFqq8FGInPu7VkRAaO40jezy5su8IFpn1n8dzhntKoIpq1Peys27dVsVLeI6iX
         JRhvr6iD0bhk5gOSMFCCsjwXhMnzPWYsHRFyZaRS7ExMs0XwFszlUT2Y2WaqlrvLvOCU
         BOYFGZWisSclyMuX0DjwpSuO/h35+dKXj9EmnfOofuE2c1h3S3PINQ/h39kWQR8qOYDd
         GE04kOW2sRKKaondxcvswW6zeolOAk+W08OXW0T4y3lLwagBK555PaoNxEeLp3zC2gpm
         gBew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795455688; x=1796060488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lshIRC0wDHTRV5DO4BvbFpgIVDRNFqrWH/KZR1El2a4=;
        b=bBrCsAS8ufdtCgga8wB8RPlqc9oP03m5g0fIBgw9kBnUg6R4+ox2sRgJuHTJTYGa+9
         x6AuN/bJbmlsWG+bKNS/dEGUJ1Fnb8E4oLd6/nypNSFAsH/hXnGeQMOHbMczAxsodttB
         VqWaAIzEau8x2c+TXltTtgPimlKRLFXB+YM3D2hCf9wz45ARuTCz3HANgIM3mniTAxo6
         qUed9pQwG9JS/abOe/XGkIpDAq8TGPTtYQhHW+W7j+UuVQ9EiBCKDDoC1JYRpnw/qJKC
         ljqKgYuUrvL6XQLFvW3gPNIbQkbvAltYoal60vRLaHakTHklY2ZH6BIRV9sXYWbD6V8h
         nI0g==
X-Gm-Message-State: APuU4Z9FG6w68rVjh0yvY1IcCT6Y8y68yE/8K8eyYgl7WUj/0jfUlMzn
	VQHmfd+JtmgKakaXArhaUQ48H47D3woANTnYwgPLsuzEuZPHR0b62aFjPC7bEx+N6XI=
X-Gm-Gg: AZFdTZc1OIbV2EYn3uk+d9VWGVNWfabuRlE2HcKs+tVsvKWCqKBqtOKEtuFihsoOkHe
	TzZ2gKjwovUl7X/hkdULEJVmlxdfNbOwGaMS/y3RktHc3Lcb/PJMhlnnpPhWkLhUJbYpFhOyUv/
	OTQAt5F7pDVlKFlCxXuLhBKAxkz47gmTxXPAXGdSSCC9pia/fkj2doERXahkRawckIwL6D5/VeG
	4amzexJvjGtknsaU+OCs5/7HqEuWfoquiRqWwVm0Jxm4vaHpqA7wFO1LpfB/oBuA4qB6uTzMQ2Y
	Z4GBfxITkw5f/e4vaDQwDPM5ICcXAbjV3ctRHmPvfcYWGXIWAJPs3HG1tWcbewvt3pq9ljgNUuj
	q1Y1fq6705QXwrrksZ9cX1Wm7Dc7kB8Gs2AGHnBARmYLys5vmf5sWlt3TI9+D0nEDXs6gwugaML
	FgtzJPUpEzoKsh6kB0rgZ/WKvRfazvMq1FbQUlRcbU1ZBfiGe16cdatLgIr0lhm6wrE55dTXzBe
	Sr/kf10J70Vh5+C0axRY6bvkQqCUxLVMrC52F3/wPH5HSHIBmFbYRyEZE/FZyrHT7IOyKil3YJX
	0/zHSmAna0ycS3hu19xXap8=
X-Received: by 2002:a05:7300:2301:b0:385:4c54:3c8c with SMTP id 5a478bee46e88-3856c0c9403mr18416620eec.1.1795455688464;
        Mon, 23 Nov 2026 09:41:28 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:6b::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd4efesm39021383eec.12.2026.11.23.09.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 09:41:28 -0800 (PST)
From: Stanislav Fomichev <sdf.kernel@gmail.com>
X-Google-Original-From: Stanislav Fomichev <sdf@fomichev.me>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Subject: [PATCH net-next 3/4] selftests: drv-net: add a kperf stream test
Date: Mon, 23 Nov 2026 09:41:19 -0800
Message-ID: <20261123174120.505808-4-sdf@fomichev.me>
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

Add stream.py, which measures the throughput of one TCP connection with
kperf, with the same settings as devmem.py otherwise: once over copying
sockets, and once with MSG_ZEROCOPY on the sender and
TCP_ZEROCOPY_RECEIVE on the receiver. kperf pins the application a few
CPUs away from the interrupts of the flow, so that the CPUs of a run do
not depend on the scheduler. One connection is bound by the CPU rather
than the line rate, so that the throughput follows changes to the cost
of the stack and the driver.

Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
---
 .../selftests/drivers/net/perf/Makefile       |  1 +
 .../selftests/drivers/net/perf/stream.py      | 40 +++++++++++++++++++
 2 files changed, 41 insertions(+)
 create mode 100755 tools/testing/selftests/drivers/net/perf/stream.py

diff --git a/tools/testing/selftests/drivers/net/perf/Makefile b/tools/testing/selftests/drivers/net/perf/Makefile
index 91feb0d62a7b..b3f9dcac700b 100644
--- a/tools/testing/selftests/drivers/net/perf/Makefile
+++ b/tools/testing/selftests/drivers/net/perf/Makefile
@@ -4,6 +4,7 @@ TEST_PROGS := \
 	devmem.py \
 	iperf.py \
 	rr.py \
+	stream.py \
 # end of TEST_PROGS
 
 TEST_INCLUDES := \
diff --git a/tools/testing/selftests/drivers/net/perf/stream.py b/tools/testing/selftests/drivers/net/perf/stream.py
new file mode 100755
index 000000000000..4ed9d64dfa32
--- /dev/null
+++ b/tools/testing/selftests/drivers/net/perf/stream.py
@@ -0,0 +1,40 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+
+"""Measure TCP stream throughput with kperf."""
+
+from lib.py import KperfRunner, KsftNamedVariant, NetDrvEpEnv, ksft_exit
+from lib.py import ksft_metric, ksft_run, ksft_variants
+
+
+@ksft_variants([
+    KsftNamedVariant("copy", []),
+    KsftNamedVariant("zerocopy", ["--msg-zerocopy", "--zerocopy-rx"]),
+])
+def tcp(cfg, mode_args) -> None:
+    """Measure the throughput of one TCP connection."""
+    stream_args = [
+        "--time", "15",
+        "--num-connections", "1",
+        "--read-size", str(64 << 20),
+        "--write-size", str(64 << 20),
+        "--pin-off", "4",
+        "--validate", "no",
+        *mode_args,
+    ]
+
+    with KperfRunner(cfg) as runner:
+        result = runner.run(stream_args)
+
+    ksft_metric("throughput", result.target_throughput, goal="higher")
+
+
+def main() -> None:
+    """Run the stream performance test."""
+    with NetDrvEpEnv(__file__, nsim_test=False) as cfg:
+        ksft_run([tcp], args=(cfg,))
+    ksft_exit()
+
+
+if __name__ == "__main__":
+    main()
-- 
2.53.1-Meta


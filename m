Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795455691;
	b=FSrmWx7Xc68HEsxU9fPOErt9t1vk/kYAFby+AN5rDVD0n9mW9tyB7tuzD70gut47KIWg
	 oB/yU64Aq2tpfEJRx0u3QzHdGSET7yPmle9kdYqwwp2shMC6RYR6SC/ghsDVbo9KdhaOe
	 Vsv48RAvcB29XhtOVWRBXnOwpubE+eqRBm0CrqzPqcgxTFm0p1S3ZAFOOT30YcseO9rYu
	 ACjU5t2wufxeN9TvlvU63ekoSM9J1F0KyayjBgv/CfSqS3FnFVRpSBeYaszMEG+7WQ8I6
	 q9tan2JKWw9L+3p/yHZaD50dOlGvRZfNrH0ntzMzO5GYO5w9FB73akLaUoyGeAm4V0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795455691;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=4IGoIcGsWUft5YVGktF5809rQkJhVmcEjghtz2ApRNg=;
	b=Vk6sPm10ZanqS2egZA+SN8Dnb77jmQKRf8rvVsVI3B/qeEN4CKD05HYWK0/XOgBj/1q2
	 3M5qEo8ghz+fyPpFc+vhdxDp1TOgeqBbWi53Ea4I8BCbp2xjBhCxoTBdrK8TJuyFlqtLj
	 VSZmhKQFZlkZRgKgy0CrEK+ppVnRVIGCOx4/S7p9oN6jW2hDYKl3h0qIRAkGTrHvdN2TM
	 1tbBKX6WYUCIohhm3Vtt1PsOHisQYN7/J/od3W2MYG7kuiqStaNKxhqid9Yq67leffg4V
	 7IPpalcl/vDfTMCaQWXoAbyAPFQRqXr0gJQtY3rwx3a22kLXtDFje/eGQ+Lp8hNbMyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="OYQGZ/oA";
	arc=none smtp.remote-ip=74.125.229.5
Received: from mail-dy2-f5.google.com (mail-dy2-f5.google.com [74.125.229.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996F8606A330
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 17:41:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 996F8606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OYQGZ/oA
Received: by mail-dy2-f5.google.com with SMTP id 5a478bee46e88-36f936424f2so994424eec.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 09:41:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795455690; x=1796060490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4IGoIcGsWUft5YVGktF5809rQkJhVmcEjghtz2ApRNg=;
        b=OYQGZ/oA8OM1MIc8Jg6zuAziA3dnCLXrt/f5ylKNScQPuZRmsrewFMvalKF/DiyKK8
         9Yao4dIaIyj1xcn0vryHEN5KdD6+UfZMIeRqeWdoZexeoA/IP2YE1JCSL89f71pjUsKO
         e7hNqnFEC7/O1aMiMQPlYz3rQ5Sn5+ZGMAmF6a+mSjHScClXoRon/X0QfkdEm4obfwR1
         AdU36DQaoJ+C3JFRucvIC+2ho/Q0xCHOSoteYEC73nlftxiaPTRhexF6imdMdIOPEWjt
         pwYZg2bvCAe7rhBt3cmgX40rGIwKN57NbULoRScYNjjaTvOk6qbYOc7Cw9shxplGU+Yd
         jQpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795455690; x=1796060490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4IGoIcGsWUft5YVGktF5809rQkJhVmcEjghtz2ApRNg=;
        b=KarH8Z+M/Vt/bWe8021T5CtmXyvOBy99nqVYzus+RXiiRMNsbM250eitV9+8k0XQnG
         Gtw9VoEdSmUxVkAIC8ck43tDLVOrknd1F8pIz5Ee0xBi1X7WeKyLl3LOFG3DkHtMmx1C
         /gfG63IkNIqsgYpbm/iDxW9mXHWoc0Pf1SgG51vy/uduLcMMQXS6jhUzQWB9g/Ru3jjm
         vLCwq2SFNOGEnR8fozPprr9SXWCOsGSoFF83EzxqSZXnIwqRfpZ/7qKA4J762SMgW1Fq
         19M/GVPXqyh6SYwyqHlPFaV50mDX4f6/VzaFW0kQOjI6KYD1ZKifVn6//OPOmPP+Fh/f
         dRzg==
X-Gm-Message-State: APuU4Z8FLQ8va1cZjijoQly3PLtu+pbk46TtdG3yUJ8CCtko1s4OLPMP
	7EgmWCOd+EfXRinm2Js8aM9xIt/TmnlZxIXcifo3VgH8jJq93npHG3WZ+dE5Dx26/BE=
X-Gm-Gg: AZFdTZctccfFjpVuyfPzg9On/V/Q+9TPKFTvu8jYEg+WFIakjaWYu4aZxtV/5HvRHXU
	CEox3/Ko98Z+wSW1cqNR9YMiUYtelK6OXu0DOkwQdzkM+4GvdBUpUbJNBN5F3+tIQ2HBobl3a8y
	dceYpZID2TZ/vSvGI3/nplInDELarfBeqPaYUPau1aY/9eTZyxppgvRPM9jIU5rC86TMay13UX0
	jN6qWt4bVCABP+M7tglUgLpaZdU13BPTKUgC1KQSbqrFKl748QT5YOOytaoRHxHv+mRurqTLfJH
	gN1591J9dDXCfikOgzelO4yiD1uU6h64GUYXf7eKwecoEJEjGm6XDce53hSMTt4Q1RMYjkFjpZL
	qume10furWwYOeJcXvInra8m2qW1qCIebSDIDGEHKbgL004+6r3uTsvB8xvNuMGFtaA8KKzWPw5
	oHo0IN3tj46HEcwo5vYEDtPbAFBjBhJuuP0W/a5dRCFPHHC/LNKB3fgvlDy2ZZPttrwlAagJNnW
	oNSR2ZRawDBnZcBpUjw0VokCUvSLaAjfYYP5v/wss1CKA0B/VtHWl69mwfFuC+9/rTxUWkG+kWG
	OoJ3ReycpNym7oUJSHXU9EY=
X-Received: by 2002:a05:7301:6405:b0:381:a3bb:f945 with SMTP id 5a478bee46e88-38570254ec3mr14653205eec.22.1795455689481;
        Mon, 23 Nov 2026 09:41:29 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:6e::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c349csm39987991eec.22.2026.11.23.09.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 09:41:29 -0800 (PST)
From: Stanislav Fomichev <sdf.kernel@gmail.com>
X-Google-Original-From: Stanislav Fomichev <sdf@fomichev.me>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Subject: [PATCH net-next 4/4] selftests: drv-net: remove the iperf performance test
Date: Mon, 23 Nov 2026 09:41:20 -0800
Message-ID: <20261123174120.505808-5-sdf@fomichev.me>
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

The throughput of one iperf3 stream changes by about 10% between
back-to-back runs on the same hosts, e.g. from 90.7 to 99.6 Gbps over
four runs, as much as a regression would. stream.py measures one TCP
connection with kperf instead, remove iperf.py.

Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
---
 .../selftests/drivers/net/perf/Makefile       |  1 -
 .../selftests/drivers/net/perf/iperf.py       | 23 -------------------
 2 files changed, 24 deletions(-)
 delete mode 100755 tools/testing/selftests/drivers/net/perf/iperf.py

diff --git a/tools/testing/selftests/drivers/net/perf/Makefile b/tools/testing/selftests/drivers/net/perf/Makefile
index b3f9dcac700b..898236833c42 100644
--- a/tools/testing/selftests/drivers/net/perf/Makefile
+++ b/tools/testing/selftests/drivers/net/perf/Makefile
@@ -2,7 +2,6 @@
 
 TEST_PROGS := \
 	devmem.py \
-	iperf.py \
 	rr.py \
 	stream.py \
 # end of TEST_PROGS
diff --git a/tools/testing/selftests/drivers/net/perf/iperf.py b/tools/testing/selftests/drivers/net/perf/iperf.py
deleted file mode 100755
index 5b6f0bce2a03..000000000000
--- a/tools/testing/selftests/drivers/net/perf/iperf.py
+++ /dev/null
@@ -1,23 +0,0 @@
-#!/usr/bin/env python3
-# SPDX-License-Identifier: GPL-2.0
-
-"""Measure TCP throughput with iperf3."""
-
-from lib.py import Iperf3Runner, NetDrvEpEnv, ksft_exit, ksft_metric, ksft_run
-
-
-def tcp(cfg):
-    """Measure TCP throughput."""
-    result = Iperf3Runner(cfg).measure()
-    ksft_metric("throughput", result.throughput, goal="higher")
-
-
-def main():
-    """Run the iperf performance test."""
-    with NetDrvEpEnv(__file__, nsim_test=False) as cfg:
-        ksft_run([tcp], args=(cfg,))
-    ksft_exit()
-
-
-if __name__ == "__main__":
-    main()
-- 
2.53.1-Meta


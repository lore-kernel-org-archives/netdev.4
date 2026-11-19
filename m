Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795115629;
	b=prEiDfNZMO28nPVOk+na8Vx6EwOS+9i7rPCHzI6nSqpDeEjUtT7c8Y+R/EJaRX1GPjcL
	 UAtjCUnfLJ0lcK5Ez0TN6vBVrgpzXxwf6kOtCYrm91wsUiulrzK9jx0SAee864WAiMj3+
	 pHNRJNp8lxRUzRgKQm7G7SVbzDqWYFXQFYjgorpXB8LMD3NSegt7wGVHkHiCdV7tEYkNY
	 6lUOnSO1QUtIEjePhVRZH5WPnPqj3DpJR0YQIESXjbh4ZCVzbxBF4ufwo8J6hoNxRiUH2
	 FGYKZIH/GJyGFeUAMpbkvQQX65nN6DMB9eUHcc5f0sNcPc4PNcdAPaEUeNiN97j/kdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795115629;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 Received:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=2uRzIgoX7QgJ0b9rPImUpCV7/J8FxvsFPO0XMJFT2Y8=;
	b=TgZXG6helecLRd0IBUu28lv6zX9c8nW5pW0r8sMJS+degShllv+MQzWUEManjI98DQ+B
	 xV/mRYTqqVHsql+QixytfV1m0XB9lUxbuXOgBFWAbrYkcC9Tog2JVYE0SjyyTWA59Ko9r
	 zFeWbgxOf+nwsnfTMFNDK1zs+CxZbKtvjsWr/DuOGOE8aKAtyprU2HasK+b0VvwoLMDO8
	 daXn0dIMLzJi83sBPt2A4cocHdVbs4RvBzVtXhtbsh3Ll1pI6oZU+kWCQFI1Fih3kMjRM
	 231SmZRe1c+ao/WJP3YVsso4O+BO5c8MZGGrY9QvjyYKi1NPo73kbcQyrUY/I7BqCcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=LOGH3yxu;
	arc=none smtp.remote-ip=209.85.215.228
Received: from mail-pg1-f228.google.com (mail-pg1-f228.google.com [209.85.215.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B24606A326
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 19:13:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37B24606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=LOGH3yxu
Received: by mail-pg1-f228.google.com with SMTP id 41be03b00d2f7-cd6acc50b8dso64799a12.3
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 11:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1795115628; x=1795720428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2uRzIgoX7QgJ0b9rPImUpCV7/J8FxvsFPO0XMJFT2Y8=;
        b=LOGH3yxu/CnlOhkBHfv331z2/tuavip031nqJynu+3QOD3dnOti34PFc/2meBPJIZz
         LIkBTueoQo60ZNT+aM8zjWI09GEFOdFlaa+ZRfSf+HBlQBCJuMZR3HiRImn9kjmmgAm2
         Kvc1RcqwURj0Up/h74V0MqBb9GruXpk4ui503BAIxTrKkApAd9/dfsahNsq41NZIbbLA
         EZ09Dw7w2NN3WWERF6j3rlfLuObOybepw2OUf8Du/DCVFTFQZJQdVWiynmFZbB0cq2bi
         IkEf8JfQTW7Hx1CQtFNU7JuivCmih67MoNzeOD/vf34twYiJVm8dA/Zarr5RV4+nHLmr
         tx4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795115628; x=1795720428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2uRzIgoX7QgJ0b9rPImUpCV7/J8FxvsFPO0XMJFT2Y8=;
        b=tFgwPIQ23wyFGKRQnVBOJOjnWzaXDu+KGEYwzLMCRhOJ3ITpUyQ+bUOXGBelU7QtT/
         pmT3nwb7SbA2Ri7EeeIb+YbTNuC/X8uHKmMxhKRcNkCMFvDpKP6hQ+xApocvKN5K1ATb
         SZ8YZFdN3wBf6+yc1MdrRaOo6L1u11RjylHXK/DKnySQp/Qmas39+QiXceCDw1ZtLt8U
         YS4qiLhuOFxfI6lxqEiTmDq4HAbxsR9Wha7E8pFVid/Vi9t6SbEqH2ElIV+50/sNuhM0
         HmcoEFvQrLXIu1bVSNOsX8VUoosLCykIb5V+0D3U+E7ZUr+UfuAP1OC7gnYsOvWFXIC4
         G6cQ==
X-Gm-Message-State: APuU4Z9E5mtQaRoua0kgpBkAZniCPcoLO5SZKBThoqFLM/dU0Tm8wJQ4
	wQbsancNEx8n80cTd5jF/zttqTCDcZDdjIG2UnqkjcKACrGDLnIHCFORAHb+oeebkPz4GlqoCCD
	rJj9zbcMMx+p/vl7XQV8q/wYVvY79VG+EeD31++JB8dXhT6moukEs
X-Gm-Gg: AZFdTZcaFAoQAfXsUDEH/2X0t/aIUMVJqOzGxFgxQUu8Jh7n34lyRNWhRmdallJ0u2c
	/UZTkgpgcAmKEbTvCVHL+J2MRGjGczzhczdl+ue92L2QPk9ELBIYagzoxmOy3loB6fMu/xv4Mtf
	F+7lsNTigTGyV0fDiuL8v+O3ypmZ5gOt1UQDYB8JwmzjTw3nNWtwjqFgYjG5bf3T4K9rj6S5ZIJ
	QAGTKo3y36cDWUn+2P5Ai5T1Dw34Plfc/udWGzqMl3U2kjRTfV5WHfmLwSw834H76WWsE4pPQQM
	cbf8oO6qrPpAfTAl1sBXLuBVASMPzgu4LXMA2nMeSwQBfgHyxpEXWj+z/Ru1lNYuYdAgVHdn4Tk
	eADVlFBPKLUq12A9O9lEG
X-Received: by 2002:a17:90b:2ecb:b0:3b3:c45e:c715 with SMTP id 98e67ed59e1d1-3b41c95e7bcmr268669a91.50.1795115628581;
        Thu, 19 Nov 2026 11:13:48 -0800 (PST)
Received: from c7-smtp-2026.dev.purestorage.com ([2620:125:9017:12:36:3:6:0])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41d23b49fsm40355a91.1.2026.11.19.11.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 11:13:48 -0800 (PST)
X-Relaying-Domain: purestorage.com
Received: from dev-rjethwani.dev.purestorage.com (dev-rjethwani.dev.purestorage.com [10.17.2.234])
	by c7-smtp-2026.dev.purestorage.com (Postfix) with ESMTP id 9BD9B402AE;
	Thu, 19 Nov 2026 12:13:47 -0700 (MST)
Received: by dev-rjethwani.dev.purestorage.com (Postfix, from userid 1557719937)
	id 98FE2DC1565; Thu, 19 Nov 2026 12:13:47 -0700 (MST)
From: Rishikesh Jethwani <rjethwani@purestorage.com>
To: netdev@vger.kernel.org
Cc: Rishikesh Jethwani <rjethwani@purestorage.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net v2 2/3] selftests: net: py: add a bkg() timeout and kill the child when it expires
Date: Thu, 19 Nov 2026 12:13:38 -0700
Message-ID: <20261119191341.4089157-2-rjethwani@purestorage.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261119191341.4089157-1-rjethwani@purestorage.com>
References: <20261119191341.4089157-1-rjethwani@purestorage.com>
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

bkg() waits a fixed 20s for its command on exit and, on timeout, raises
with the child still running, outliving the devices and namespaces the
test tears down. Add a timeout argument for that wait, and kill the
child when it expires before raising TimeoutExpired as before.

Signed-off-by: Rishikesh Jethwani <rjethwani@purestorage.com>
---
 tools/testing/selftests/net/lib/py/utils.py | 28 ++++++++++++++++++---
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/net/lib/py/utils.py b/tools/testing/selftests/net/lib/py/utils.py
index 1727bc418073..7a3fc39db334 100644
--- a/tools/testing/selftests/net/lib/py/utils.py
+++ b/tools/testing/selftests/net/lib/py/utils.py
@@ -104,13 +104,32 @@ class cmd:
     def _process_terminate(self, terminate, timeout):
         if terminate:
             self.proc.terminate()
-        stdout, stderr = self.proc.communicate(timeout=timeout)
+        timed_out = None
+        try:
+            stdout, stderr = self.proc.communicate(timeout=timeout)
+        except subprocess.TimeoutExpired as exc:
+            # terminate() is only a request, and bkg() with exit_wait or
+            # ksft_wait never sends one, so kill rather than leave the child
+            # running. That does not stop a command run over ssh on the
+            # remote; it needs a bound of its own.
+            self.proc.kill()
+            try:
+                stdout, stderr = self.proc.communicate(timeout=1)
+            except subprocess.TimeoutExpired:
+                # A grandchild (shell=True, ssh) still holds the pipes.
+                self.proc.wait()
+                stdout, stderr = b"", b""
+            timed_out = exc
+
         self.stdout = stdout.decode("utf-8")
         self.stderr = stderr.decode("utf-8")
         self.proc.stdout.close()
         self.proc.stderr.close()
         self.ret = self.proc.returncode
 
+        if timed_out:
+            raise timed_out
+
         return stdout, stderr
 
     def process(self, terminate=True, fail=None, expect_fail=False, timeout=20):
@@ -179,11 +198,12 @@ class bkg(cmd):
     """
     def __init__(self, comm, shell=None, fail=None, expect_fail=None,
                  ns=None, host=None, exit_wait=False, ksft_ready=None,
-                 ksft_wait=None):
+                 ksft_wait=None, timeout=20):
         super().__init__(comm, background=True,
                          shell=shell, fail=fail, expect_fail=expect_fail,
                          ns=ns, host=host, ksft_ready=ksft_ready,
-                         ksft_wait=ksft_wait)
+                         ksft_wait=ksft_wait, timeout=timeout)
+        self.timeout = timeout
         self.terminate = not exit_wait and not ksft_wait
         self._exit_wait = exit_wait
         self.check_fail = fail
@@ -203,7 +223,7 @@ class bkg(cmd):
         if self.proc.poll() is None:
             terminate = terminate or (self._exit_wait and ex_type is not None)
         return self.process(terminate=terminate, fail=self.check_fail,
-                            expect_fail=self.expect_fail)
+                            expect_fail=self.expect_fail, timeout=self.timeout)
 
 
 GLOBAL_DEFER_QUEUE = []
-- 
2.50.1


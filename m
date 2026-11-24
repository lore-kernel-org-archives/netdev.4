Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795529549;
	b=29Ghb48dqs6xg5wZwkXjpu8wug+trjFK0k2F54qIDvSYyr6ammBvgO2FYF4AS9qZjmdR
	 zIPT0hXGLHTyvEOrrasFXEd05HCl2q9g046/kbGIuzb/xkv3CmH4WX7svsswHBtZOjq3a
	 zV65ofn1T/4lI3eiqSfTacnGBDYzIpZRYXslsl7wf+4ZWZhnZfqIVmQHn6tEY8EO1TQi3
	 AoDdLSaNfU0aDS1mmjLZtNaw+OwkO3HUOsmPUpuaK2oLaQqoqgxvkUnue+h8kEvt91K63
	 EFsJOUmJoYB/3ZH0xNZma5lq2NQciTeeHq8xKa5myq1Gsydg7GfaF8eRNr7U8+baDmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795529549;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=I8cSuoiKKCPOnavUZXK09ITL4vjs3EgWF257jgW01Gs=;
	b=hvurp9SRrSFDnW2h373c1UjeqWaB4sGY4WiWG/nkqBWmPWFlofVOlyyKuYAZQkSsKHxW
	 Ow0RPsUqi4Oyv5iENpWELxtRcVRZjkVSqPkGCHK3qj3A+Dujf0ocutzoK//QDyTH0kEdu
	 WqHxSvy3Mr/pfb4LQNXhNyXJ/6JdE1KNSEC3yYzWs1VbFvgHXRfrd5vYcVuDArx5A6Uit
	 wTHjidAkHhclMFClzqppHnXz7WgWZKIEMRZL2dDD2LeKSrK27rVfOxuVhyOkDC5nR+qFB
	 ninsGVexccd06fUgsUUdOsOcw2o82iDJIVAbZrp6PLcNFh5IOpK24429vHCLQ2U3XQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=fkdJxOgB;
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F7A606A339
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 14:12:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99F7A606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=fkdJxOgB
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b87a92c17eso6391365a12.3
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 06:12:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1795529548; x=1796134348; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I8cSuoiKKCPOnavUZXK09ITL4vjs3EgWF257jgW01Gs=;
        b=fkdJxOgBoaXmx4Uq9NG2pEj1ki5zp2qhfGRNWrw2H1/hqJNoO42DJuCwjp9+3dUvd+
         jtK/UW2Yz+IZw9v8/dbVAQ8Ezm+jDWLtIPTewtA9CItm7vc1j71Ct0XTM47g6pAS/STj
         LPRz222/rN7lrLxtqb/sIKRnW5rHmyxgIj3bE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795529548; x=1796134348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I8cSuoiKKCPOnavUZXK09ITL4vjs3EgWF257jgW01Gs=;
        b=jFX1G7n6xvnI2+xtLqq2iRb0RXNzEghstVj1mwLNaO2At0GVuT0m0oNinWH0TQ7wI7
         vIdW6crm9RDQSjzEKdLVLw4zYDCRGtLCMbnzMqbdqvyi9IjS9ayXq1nrgH9nNVq20/0A
         qooPPTSdxs0ugOflEJgQHJC6C9935TaA5YZdJz9zGniQx9ACb/1yj4f2Ti11L4fV5gYk
         HkQsKrVchyZ31zjr3EzBf9mCajhQeUtfBBFUF4bkrncCJ2qUxgIOnMiPG2QWlPd87E9M
         fUNj1f2IYkyNxk/eeWaYo0MU4kuXiyBPRD8I9HhuN3h4513nWRYnrniO3H7sxvK71+CW
         jMNg==
X-Gm-Message-State: APuU4Z+cA3glzh4C8/qIVhrRqsuQB5BBXY0ZfCJ+lt+ntnSbdw0O8sZl
	dro2Vg44gLUYd5sBFpF3aOAHEtn1uUDu8l8zxTdvX7rsMuJTAdSEwDr0kPx76hbY/e9KSmFgRXF
	PeBc=
X-Gm-Gg: AZFdTZf/MppH3XfuuI8jwobsP+a2/6uuc0tiSsuLLaELRRSIht6tr8H9/86HKMhROfO
	lSI1LEq2DwcPpercZ/6+C3nWYX8yit0yKP3ivVEgK8t+8Jz0EdzNVoWjFDrdWgIXUGI1C+WT7Db
	U82AXd6jyWDIlTzo22OwHkWLiP3g+RpTzAfQneOvemLxmnoxgYO7748b/IJyoQC2sqrynN3fPv6
	MDzJg+i75pRXQoKuY2zcFLaYbPD/Bz3xTwF+t401qP8DASViHqq1b+OH2unNpKHYZbl2TsbX65W
	cM5Smoh2x2FK3xH4btPEfYrn7Yh/UvHg1o//yh1bJlWfB+tkj2VCfXMhNexTZJLl64/bNkCHxwk
	9D9MmdsIyu7r3GuOMotPliVtocDXPbUJuYvdROaydzIvFJXHYKJaIGH/t7YVPy/1eHaj6lZCphZ
	cfjb1dd8kiT0mJtwmBsvWlClhIqGKZhVJc74UkeOXAu4iAZ4RiqDK0OTA5pk6zvqqbXbamkOlN2
	cwPQJrrHb5fl268oPAlWPnokrqKJvFtbtshEB3PCYdC2sjwgGc0EWjmxH0qi1IoycCvDvQQk20e
	8qhon1PIW16+ow7r91Q43dPzYQN+F9U7g7FkpKGCUw5XIMwTOgrJE+EirVCeieCnGvE/jWX99a0
	=
X-Received: by 2002:a05:6402:210a:b0:6ba:a7d7:4e21 with SMTP id 4fb4d7f45d1cf-6baa7d75253mr5685496a12.35.1795529547924;
        Tue, 24 Nov 2026 06:12:27 -0800 (PST)
Received: from mbili.waya ([64.203.83.2])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba7b9570e9sm5032739a12.36.2026.11.24.06.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 06:12:27 -0800 (PST)
From: Jamal Hadi Salim <jhs@mojatatu.com>
To: netdev@vger.kernel.org
Cc: Jamal Hadi Salim <jhs@mojatatu.com>,
	Jiri Pirko <jiri@resnulli.us>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Victor Nogueira <victor@mojatatu.com>,
	linux-kselftest@vger.kernel.org,
	Po Liu <Po.Liu@nxp.com>
Subject: [PATCH net v4 3/3] selftests: tc-testing: act_gate: cover the new cycle time and interval limits
Date: Tue, 24 Nov 2026 09:12:10 -0500
Message-Id: <ACT-WEXM.v4.r0.20261124074514-3@mojatatu.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <ACT-WEXM.v4.r0.20261124074514@mojatatu.com>
References: <ACT-WEXM.v4.r0.20261124074514@mojatatu.com>
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

The tests:
The gate action now bounds the base time and the cycle time at KTIME_MAX
and refuses a schedule entry shorter than 10 us.  Cover the four
refusals, both ends of the cycle time range and both sides of the
interval boundary.

The refusals:
A base time or a cycle time of 2^63 is above KTIME_MAX, so it is refused
as out of range; a base time of -1 reaches the kernel as the largest u64
and is refused the same way.  An entry interval of 9999 ns is below the
floor and is refused as an invalid argument.

The accepted values:
An entry interval of exactly 10000 ns installs and reads back with the
interval it was given, and so do a base time and a cycle time of exactly
KTIME_MAX.

Context note:
tc does not pass the action path's extended acknowledgment back to the
caller, so the negative cases re-run the failing command and match the
kernel's own error text instead of relying on the exit code alone.

Signed-off-by: Jamal Hadi Salim <jhs@mojatatu.com>
---
 .../tc-testing/tc-tests/actions/gate.json     | 189 ++++++++++++++++++
 1 file changed, 189 insertions(+)

diff --git a/tools/testing/selftests/tc-testing/tc-tests/actions/gate.json b/tools/testing/selftests/tc-testing/tc-tests/actions/gate.json
index db645c22ad7b..1c910e07c41c 100644
--- a/tools/testing/selftests/tc-testing/tc-tests/actions/gate.json
+++ b/tools/testing/selftests/tc-testing/tc-tests/actions/gate.json
@@ -347,5 +347,194 @@
         "teardown": [
             "$TC action flush action gate"
         ]
+    },
+    {
+        "id": "c873",
+        "name": "Add gate action with the minimum schedule entry interval",
+        "category": [
+            "actions",
+            "gate"
+        ],
+        "plugins": {
+           "requires": "nsPlugin"
+        },
+        "setup": [
+            [
+                "$TC actions flush action gate",
+                0,
+                1,
+                255
+            ]
+        ],
+        "cmdUnderTest": "$TC action add action gate sched-entry close 10000ns index 100",
+        "expExitCode": "0",
+        "verifyCmd": "$TC action get action gate index 100",
+        "matchPattern": "interval 10us",
+        "matchCount": "1",
+        "teardown": [
+            "$TC actions flush action gate"
+        ]
+    },
+    {
+        "id": "2c35",
+        "name": "Reject gate action with a schedule entry below the minimum interval",
+        "category": [
+            "actions",
+            "gate"
+        ],
+        "plugins": {
+           "requires": "nsPlugin"
+        },
+        "setup": [
+            [
+                "$TC actions flush action gate",
+                0,
+                1,
+                255
+            ]
+        ],
+        "cmdUnderTest": "$TC action add action gate sched-entry close 9999ns index 100",
+        "expExitCode": "255",
+        "verifyCmd": "$TC action add action gate sched-entry close 9999ns index 100 2>&1",
+        "matchPattern": "RTNETLINK answers: Invalid argument",
+        "matchCount": "1",
+        "teardown": [
+            "$TC actions flush action gate"
+        ]
+    },
+    {
+        "id": "92b8",
+        "name": "Reject gate action with a base time above S64_MAX",
+        "category": [
+            "actions",
+            "gate"
+        ],
+        "plugins": {
+           "requires": "nsPlugin"
+        },
+        "setup": [
+            [
+                "$TC actions flush action gate",
+                0,
+                1,
+                255
+            ]
+        ],
+        "cmdUnderTest": "$TC action add action gate base-time 9223372036854775808 sched-entry close 10000ns index 200",
+        "expExitCode": "255",
+        "verifyCmd": "$TC action add action gate base-time 9223372036854775808 sched-entry close 10000ns index 200 2>&1",
+        "matchPattern": "RTNETLINK answers: Numerical result out of range",
+        "matchCount": "1",
+        "teardown": [
+            "$TC actions flush action gate"
+        ]
+    },
+    {
+        "id": "8265",
+        "name": "Reject gate action with a cycle time above S64_MAX",
+        "category": [
+            "actions",
+            "gate"
+        ],
+        "plugins": {
+           "requires": "nsPlugin"
+        },
+        "setup": [
+            [
+                "$TC actions flush action gate",
+                0,
+                1,
+                255
+            ]
+        ],
+        "cmdUnderTest": "$TC action add action gate cycle-time 9223372036854775808 sched-entry close 10000ns index 300",
+        "expExitCode": "255",
+        "verifyCmd": "$TC action add action gate cycle-time 9223372036854775808 sched-entry close 10000ns index 300 2>&1",
+        "matchPattern": "RTNETLINK answers: Numerical result out of range",
+        "matchCount": "1",
+        "teardown": [
+            "$TC actions flush action gate"
+        ]
+    },
+    {
+        "id": "7d1f",
+        "name": "Add gate action with the maximum base time",
+        "category": [
+            "actions",
+            "gate"
+        ],
+        "plugins": {
+            "requires": "nsPlugin"
+        },
+        "setup": [
+            [
+                "$TC actions flush action gate",
+                0,
+                1,
+                255
+            ]
+        ],
+        "cmdUnderTest": "$TC action add action gate base-time 9223372036854775807 sched-entry close 10000ns index 201",
+        "expExitCode": "0",
+        "verifyCmd": "$TC action get action gate index 201",
+        "matchPattern": "index 201",
+        "matchCount": "1",
+        "teardown": [
+            "$TC actions flush action gate"
+        ]
+    },
+    {
+        "id": "9f10",
+        "name": "Add gate action with the maximum cycle time",
+        "category": [
+            "actions",
+            "gate"
+        ],
+        "plugins": {
+            "requires": "nsPlugin"
+        },
+        "setup": [
+            [
+                "$TC actions flush action gate",
+                0,
+                1,
+                255
+            ]
+        ],
+        "cmdUnderTest": "$TC action add action gate cycle-time 9223372036854775807 sched-entry close 10000ns index 301",
+        "expExitCode": "0",
+        "verifyCmd": "$TC action get action gate index 301",
+        "matchPattern": "index 301",
+        "matchCount": "1",
+        "teardown": [
+            "$TC actions flush action gate"
+        ]
+    },
+    {
+        "id": "5c47",
+        "name": "Reject gate action with a negative base time",
+        "category": [
+            "actions",
+            "gate"
+        ],
+        "plugins": {
+            "requires": "nsPlugin"
+        },
+        "setup": [
+            [
+                "$TC actions flush action gate",
+                0,
+                1,
+                255
+            ]
+        ],
+        "cmdUnderTest": "$TC action add action gate base-time -1 sched-entry close 10000ns index 401",
+        "expExitCode": "255",
+        "verifyCmd": "$TC action add action gate base-time -1 sched-entry close 10000ns index 401 2>&1",
+        "matchPattern": "RTNETLINK answers: Numerical result out of range",
+        "matchCount": "1",
+        "teardown": [
+            "$TC actions flush action gate"
+        ]
     }
 ]
-- 
2.43.0


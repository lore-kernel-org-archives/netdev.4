Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779826;
	b=nojk1KsPDhm1mELYrbBqjlqMtBCqRFnV5ARUlEXGK3hrJuT44GZv/81A64k6GjG/bmKh
	 WjFKl8dLNjBc5sJxbisPmej6pVHOoYIdoeQQGqmU1rDFyJ54WRASTzFg6sHfka25ot51o
	 j5oDAilmYn79eFSfPAzIsYiTjnyN7nT0HGiS8OnH7Hi8fW6ivATh0wGQRR83OZYQbmpD6
	 sJlSXw618Zwh+yPuJDchx32pM/Q9shQKDYgFFKjohp298YG5NHx4sLpv4LUvQPlESGrF/
	 /EGNrhGXEkkRkQJF9mB3PwvbUV8JDuuinlhabjEt+LO+MR3/xFSh7xH7ppxQw5d2NnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779826;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XcSXK5rWXolEwTqbF/BCgzXzRtdRpf4gIQiNQY2GeVc=;
	b=N511lLE+N7iIKJcpGfA2YpUn1or7ZOBi3OD0/SyekNmBMwzZ1SnJdp5NgMZitbqYi2ag
	 0bWiadbnEnyBOdFgmTlFm7ndp/2m2SEn/8b99ad4RoGcd/PVxKrHh8Nqr3RiTfl5PZKyG
	 s0Kd9hnHmQDFutMkTOepC6rHgHrevJ7zmNYSQNovm12h/J2tEtVgY3kdMxobMlEgilWwi
	 xgj08QvAMYQ9eATnVOFkEyvXFxV3jDWZN64w03BHNPyoyXuMNNTV8t2Kj1Ql04JKDLiio
	 1NRbQA5nnKFpviOYvDhgOhdgpApFUn4xC9GBE49IRxonC5bcXg0KCeCq4TgXli0B4Zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=dGw07kn3;
	arc=none smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0492606A31E
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 11:43:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0492606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=dGw07kn3
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-55d846e884eso49902951cf.2
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 03:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1795779825; x=1796384625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XcSXK5rWXolEwTqbF/BCgzXzRtdRpf4gIQiNQY2GeVc=;
        b=dGw07kn3kMZtQ0j4Y0Am+VjFse7tvg47sQhN44ULp9Ve/er+PjsrAHpIp0h9EscWEc
         G5hjOirwd5nzeKTLQeexK37Rzjcs2Ed0aM6glDjucCP+DL5zCkjmKXndvF8FrKx6HpPl
         4WbPp7p4yWCKsvxci9HOGDOhv0qBVP6rFhLEo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795779825; x=1796384625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XcSXK5rWXolEwTqbF/BCgzXzRtdRpf4gIQiNQY2GeVc=;
        b=FGcm+VZcm443NJDDWtY/GXbyUps8K5lCr+D90EhNdIda0GLdBOOXIol6lOe1lGfoqX
         7nIewbfcsmU6MK1ZyaxvrtNYFhZiTUHE4XuPNyzRSIiu9cES35Yn2q/govDekVQ1Zkhv
         GomHzjVZO2Q71Ged/zAahObLA/2OsvbUW2dx+/Jm7OtEAx2DmNNn8f9qXvgPJ4rO7Zzi
         EmmwKlNvt3BWOx6tyubH67PkUfNycttvA00PbUhTkTx9Xansd1l62QI12p3We2fGG4+Q
         boliT6F/hRMZzKOrXa40f/LmtMz8RwXr7wJItzf9ek0Lg+HNScRZNz17vP9xNevglsKo
         Kz2A==
X-Gm-Message-State: APuU4Z/L/ntHxUaF7yN87HMCKXfeWqhYq7cf0TT5PiLMBJJlPceVZmWE
	CtANs5Wq/kC9kkWK83vTCwgqodPcF69PsccX+hhFzODJhjZ7irap8n3gn+URWT0A/1HHj+WdGYQ
	ijE0=
X-Gm-Gg: AZFdTZcoobSHdD1KIMHOJiiSpwxCBVgr0/rxgwf7Vw5ibz2EMz248w99mPkqKeGhWbH
	zfeYcU2ycbGqkZwhz5jaEoDFT8jBiQLoOuEd10Qz0Nttt64A6URyGBSmxCQqrMoh0nNDbjT6LrK
	yhQ2LvDwqMrp7XgcyCxrSvt0TdYs3offX4n1YSAGts6mPD8FxYxw2LjGDnFjbwQ0VQMpKLkwtx2
	fJ+76ucQvSMEpny72JNyhxuoGhCQZ/HDctEuPgC6mCN/WHiSq5Ny0eD7qKFowQt+408NNqBSjik
	B1yE02+D1KB2GHv2bcw425OEkVVfZ0GdXWOE/zMm+Y1xcVxH+KZcrm+AlHlsKlOsxGKgd+wnCqu
	1dmphEIJyvc3qwVSZQ65y/ql5bE89ix5Gq0rO7WuUvGrBE9IIybhvmBzfH+gtg8pql3Ffsd0DXd
	OgN9ag+aFghEDXvFrutQrJZG8uzMyCpTdQdDItTsdgeMTxUTe6TGTNrSY0o5Z4ITCVNjl/Gz4g5
	g9l3vvBz0P0IHRCNyqZqjEmOdFkt6fF/hNZfwAebGiCczkTKKCVsUiJHcQrTCOjvrq63dPn0MfG
	I2bniEHZJHBZOVP6/sX9WpJmcF093S6ji+FFvt8/8Q1/KPOGVaBp8N9fm9J7c9If3ZtZ/qaIcVT
	pS3gdV4YjlIILrQ==
X-Received: by 2002:ac8:5a08:0:b0:55d:25a1:72ac with SMTP id d75a77b69052e-55d76a26882mr449612601cf.27.1795779824759;
        Fri, 27 Nov 2026 03:43:44 -0800 (PST)
Received: from localhost.localdomain ([64.203.83.2])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55dcdd1a2c6sm16652551cf.20.2026.11.27.03.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 03:43:44 -0800 (PST)
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
	linux-kselftest@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>,
	Victor Nogueira <victor@mojatatu.com>,
	syzbot+0054fed3dc9085390f51@syzkaller.appspotmail.com,
	shaos <shawnq1@163.com>
Subject: [PATCH net v5 2/2] selftests: tc-testing: act_gate: cover the cycle time and base time bounds
Date: Fri, 27 Nov 2026 06:43:35 -0500
Message-Id: <ACT-WEXM.v5.r0.20261127063407-2@mojatatu.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <ACT-WEXM.v5.r0.20261127063407@mojatatu.com>
References: <ACT-WEXM.v5.r0.20261127063407@mojatatu.com>
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
The gate action now caps the base time and the cycle time at KTIME_MAX.
Cover the accepted upper bound and both refusals.

The accepted values:
A base time and a cycle time of exactly KTIME_MAX install, and the
read-back must show the value that was installed rather than only the
index.

The refusals:
-1 reaches the kernel as the largest u64, above KTIME_MAX, so it is
refused as out of range.  The negative cycle time is tested against a
base time that is itself accepted, so the case pins the cycle bound
instead of whichever bound is checked first.

Context note:
tc does not print the same error line on every build: without libmnl it
prints the strerror text, with libmnl the kernel's own message.  The
cases accept either.

The values are signed decimals on purpose: iproute2 falls back to
strtod() above S64_MAX and the conversion is undefined, so such an input
is refused on x86 and installs on the architectures that saturate it.

Signed-off-by: Jamal Hadi Salim <jhs@mojatatu.com>
---
 .../tc-testing/tc-tests/actions/gate.json     | 108 ++++++++++++++++++
 1 file changed, 108 insertions(+)

diff --git a/tools/testing/selftests/tc-testing/tc-tests/actions/gate.json b/tools/testing/selftests/tc-testing/tc-tests/actions/gate.json
index db645c22ad7b..e5450557751d 100644
--- a/tools/testing/selftests/tc-testing/tc-tests/actions/gate.json
+++ b/tools/testing/selftests/tc-testing/tc-tests/actions/gate.json
@@ -347,5 +347,113 @@
         "teardown": [
             "$TC action flush action gate"
         ]
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
+        "cmdUnderTest": "$TC action add action gate base-time 9223372036854775807 sched-entry close 1000000ns index 201",
+        "expExitCode": "0",
+        "verifyCmd": "$TC -j action get action gate index 201",
+        "matchPattern": "\"base_time\":9223372036854775807",
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
+        "cmdUnderTest": "$TC action add action gate cycle-time 9223372036854775807 sched-entry close 1000000ns index 301",
+        "expExitCode": "0",
+        "verifyCmd": "$TC -j action get action gate index 301",
+        "matchPattern": "\"cycle_time\":9223372036854775807",
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
+        "cmdUnderTest": "$TC action add action gate base-time -1 sched-entry close 1000000ns index 401",
+        "expExitCode": "255",
+        "verifyCmd": "$TC action add action gate base-time -1 sched-entry close 1000000ns index 401 2>&1",
+        "matchPattern": "integer out of range|RTNETLINK answers: Numerical result out of range",
+        "matchCount": "1",
+        "teardown": [
+            "$TC actions flush action gate"
+        ]
+    },
+    {
+        "id": "b3c3",
+        "name": "Reject gate action with a negative cycle time",
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
+        "cmdUnderTest": "$TC action add action gate base-time 9223372036854775807 cycle-time -1 sched-entry close 1000000ns index 402",
+        "expExitCode": "255",
+        "verifyCmd": "$TC action add action gate base-time 9223372036854775807 cycle-time -1 sched-entry close 1000000ns index 402 2>&1",
+        "matchPattern": "integer out of range|RTNETLINK answers: Numerical result out of range",
+        "matchCount": "1",
+        "teardown": [
+            "$TC actions flush action gate"
+        ]
     }
 ]
-- 
2.34.1


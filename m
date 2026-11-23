Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795415600;
	b=QT6/kd4FpG87r2CLe9WHXr7gtaK+m/E+GcntioKWTh5tV57sAFw1jDj5KFFX8tuRvyYz
	 2QtLr9a6bUV6AqNCxVbDkDzbwGXMnffRcVC1ws0824eshgBgjjJGRWjTVCx8YzCGzQSDP
	 osIdpF/j0aR1tn7ZgVaiwTesQiIncP1+YEheCHlSGu1Y57Yh4cmPBRQVe4Spd3s1ClgTA
	 7FB33509S/7pkBjoQKcFbbugXkVBIhkkxgal+d44o16jHkOnkaYSyKOxAj3dTEG0wma9H
	 f+2jjV3ll6+WgPgXYkH1cUDTOw1EH7PTD7rgQA3fdPwz6iIJKjaJ1MQaUHvme0qi/gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795415600;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=m+NdFSCwXjzJeLngRwlLE+1QgBgKdpmNBcIPuiYsBGM=;
	b=eEetOkg9mZJSlCwaBwsQFfrRTtXRKFiiESAaG6/PDDiLU+600dn2lHvbcncNwEARj2SC
	 hV9N07bP8GKnVX+ZepCkgTXfcYqdFVrUeMdjnqsgQPY7aZPNmrKaqHTt/lxfQUfMorSdy
	 J3O/aS6ZUZSZN/TwW5xP8yZ+mIzqpsu7b7tLRrgZh4Rz183IAjzHl/11Dr7Ib9Bw8sW4P
	 KiD9JBHpsLTL6QRIfKlVMSFJB8+5CiM19CzZRNxgnTfuoo7bFJX3XnUaZ+si5sRLVfa0N
	 W+5mba/ukP+YsLc3xdBK3grZLbIz4LmO3AUr7/xHiz/KoefYd6a8tuJvwi7KpJARqIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UlO+4DHc;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21F9606A31E
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 06:33:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D21F9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UlO+4DHc
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1a2761c69fbso1385934c88.0
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 22:33:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795415599; x=1796020399; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m+NdFSCwXjzJeLngRwlLE+1QgBgKdpmNBcIPuiYsBGM=;
        b=UlO+4DHcUoG+T0QzkkSbYKeG1ZFhhx/z7CjtC1W4dmJ3p6MgSZ13O617cdXYbDQ0r8
         La/4mf0hs0ZIFouYv7ZToNzFe4V0e7k68+3wN0YvRRr3/FRpCMeHsJ3fjZnOivZWMcPE
         nU4huWfMfJMKU9bI2dE56w5hJfC4R3GLbEZ/uhHgk8vOn3uoqOHfmIKcMEIRhtpurU1U
         kPM7oTCT1oITSsZox5xk67xqc/X3TaITXR1tJsKlX2GOzKY4aA5gA64DKmJV1Sy+B7Sr
         m+7Y9R8TLTM796DItKMm3S4rX5A6XYmA9sSLhwE43w84F4ORa5cWYLRd0uKh3gZs4LGJ
         YEhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795415599; x=1796020399;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m+NdFSCwXjzJeLngRwlLE+1QgBgKdpmNBcIPuiYsBGM=;
        b=R3Z8lS3mJsc8JOtBqj+cZJe4TijwgqWBVZdFFA/Paw6MGHk86tUSp7XAIOWwdI12T6
         dfODJiwef5nqS2FO5hTgB10oynY5mwHpuL+aBMv2HtrC5XKmv/Q4OHLyjFDhbLbSJh4f
         npRvzA87FuMrgf2HnpkLTX8XhnpA2xNF98J3f7C6nLzA8JuRSWbOenJlAW5kO0Z1gFeS
         BuoVxPSOK2qfUwTHR4kYifAGD1Tep0XU+wGxBMoYP4SljldTssQt5q8g4FEGBJsUfsHA
         QPzeESLGRQiuxeJU6Abw9NJwQJIAZ3oImUZ9oqXaisKkRBgGAeiKWGp0bqe6uGSSjZ97
         BhNA==
X-Forwarded-Encrypted: i=1; AL+hErGEO0Zk2ITxXFYLDsjBUf8W4SG6gZ4IHyWRa+nEyHcEBtZ5klJ2uVyuPbp2LBcPaBgq0l6qSPA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/nvJXOicmoANB1/W635KxDsClW5AqgIv3pVi/FB5DDyKtmnXkC
	PgAkgJAMU90HFwyAKRCkGCl6We0JUjq7jCMM3bORP3M0ZDqp8GRtv+Nvu6COWHeA3j3If+R0
X-Gm-Gg: AZFdTZcHHdn8KkAkYSu6TttBAB40rpIqG09RWFiMXWNAUOxudDLpPJfOac1V7WRT2ni
	Gsusgrn3WmAgekbx8Znn+9Am56yPm3reVLbdtXRwDS4mpfIsnDJN2Dcot+HAKFluFJ8V/7fClDH
	8iAH2x4aeV5yuQqSUJRZusfq8oo2evISj8EvZSTLe4bqXz9MsH6CqpD0XvqGDK8ORUCgC2GHLIj
	ZQ2248H2C84W54SafZXQHdz1AkWoX+RBssNbFPoIleSZb3FRTcIwU4+RFLiyG+AooL/XU98pV+b
	yhu1CkszUXhcX+VzGKiIZf6QsABpRyeeAAgo+6od8LMxVNcMzDWNiJeu7gWXezBNP1ImzmBChRe
	warM/Ei3vK+tQR4X8nj3vsJKK3ZaB9hR2QHTQ++mNqzonVnoB0Sti4o+BcehIhZf5/1G13z4V60
	8Cv0Zq8Z5SENuZ3w8vx/qA+pAQNXOSJ3i/Nbqh5OoGvlZRIb3bZcyVptdxasduVjGmtbdQonD2h
	BUBQ2dWqu65P1sGe0I1dSrdNnNXnoTc9VoaoAU85b7qFG1oy1KX2F7+TEjTnVudEYGaR92lG/qO
	MgGOGkiYXNmkGm78bRn9/BiXKjSxFXpQwWCdV4/7qvoLjDcH/hkx9PoX2PUKiu/OvcucTlCxYpp
	NZYxNBASbd87pHMgNVY2cpq13JhETA/laGX/6b//OrnuTPl8uXohGkPjFIW6Y0ICG3mW4+TwJ3M
	3L2Ha1Mo3o35tzji5j+ciB6454FGlL0YMzmxm5nsRgLOS0
X-Received: by 2002:a05:7301:e0c1:b0:380:c3d7:c263 with SMTP id 5a478bee46e88-3856c0d076cmr12988626eec.5.1795415598719;
        Sun, 22 Nov 2026 22:33:18 -0800 (PST)
Received: from LAPTOP-3B99V33A (ec2-47-129-70-252.ap-southeast-1.compute.amazonaws.com. [47.129.70.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385d2b93dd9sm35452817eec.24.2026.11.22.22.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 22:33:18 -0800 (PST)
From: "Bin Luo (University of Electronic Science and Technology of China)" <luob87709@gmail.com>
To: oe-linux-nfc@lists.linux.dev
Cc: johan@kernel.org,
	david@ixit.cz,
	kuba@kernel.org,
	netdev@vger.kernel.org,
	"Bin Luo (University of Electronic Science and Technology of China)" <luob87709@gmail.com>
Subject: [PATCH v3 0/2] net/nfc: fix skb ownership and NCI status errors
Date: Mon, 23 Nov 2026 14:33:08 +0800
Message-ID: <20261123063310.1267-1-luob87709@gmail.com>
X-Mailer: git-send-email 2.51.0.windows.1
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

Hi,

This series addresses the review feedback on the v2 NFC callback-ownership
fix.

The issue was found by source inspection during a callback-ownership audit.
The NCI receive path can pass a non-NULL skb together with an error to a
data_exchange_cb_t callback. The audit found consumers and wrapper callbacks
that returned or freed only on success, leaving the response skb unconsumed.
It also found terminal Digital DEP error paths that freed exchange state
without completing the callback, and an NCI status conversion that truncated
negative errno values through __u8.

Both the baseline and v3 x86_64 kernels were fully built with NFC, Digital,
NCI, HCI/SHDLC, NFC-SIM, virtual NCI, PN533, PN544, Microread, ST21NFCA,
KASAN, and kmemleak enabled. All three full build logs contain no warning
or error lines.

The QEMU TCG test ran 32 NCI 1.0 MIFARE exchanges with status 0x01. The
harness provisioned the virtual controller and polling session, then ran
AF_NFC operations with effective UID 65534. The baseline returned
SO_ERROR=-240 instead of 16 and kmemleak reported 47 unreferenced objects.
The v3 kernel returned SO_ERROR=16, reported no unreferenced objects, and
produced no KASAN report.

A test-only KUnit overlay, not included in this series, ran ten callback
tests covering Digital DEP completion, ST21NFCA callbacks, LLCP error
release, NCI loopback and NCI-HCI errors, four HCI wrapper branches, and
PN533 response aggregation with an injected allocation failure. All ten
passed. Real NFC controller hardware was not exercised.

The final QEMU run used one vCPU. A two-vCPU KASAN boot hit an early
enqueue_task_fair int3 before userspace; it did not reach the NFC tests.

Patch 1 documents the callback ownership contract and updates the affected
consumers and providers, including terminal Digital DEP completion and
fragment cleanup. Patch 2 keeps NCI data-status errno values signed.

Best regards,
Bin Luo

Bin Luo (University of Electronic Science and Technology of China) (2):
  net/nfc: fix skb ownership on data exchange errors
  nfc: preserve NCI data status error codes

 drivers/nfc/microread/microread.c |  3 +--
 drivers/nfc/pn533/pn533.c         |  1 +
 drivers/nfc/pn544/pn544.c         |  3 +--
 drivers/nfc/st21nfca/core.c       |  3 +--
 drivers/nfc/st21nfca/dep.c        | 26 ++++++++++++-------------
 include/net/nfc/nfc.h             |  5 ++++-
 net/nfc/digital_dep.c             | 32 ++++++++++++++-----------------
 net/nfc/hci/core.c                |  5 +++--
 net/nfc/llcp_core.c               |  4 +++-
 net/nfc/nci/core.c                |  1 +
 net/nfc/nci/data.c                |  8 ++++----
 net/nfc/nci/hci.c                 |  4 ++++
 net/nfc/rawsock.c                 |  5 ++++-
 13 files changed, 54 insertions(+), 46 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4

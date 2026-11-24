Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541193;
	b=pngQGpY50wwR3w2JJygiyg3T9g8OKQT/ENGnUQXJeJh4Rnw4mAcPxNTWS9abMDN+rS/x
	 n0l0SIweQsdHSdIhrFSJfiEgj4Dkhq8aWqzij/4MepWN9eTaLvnsQbzcZUGqlup5lNfKF
	 ztIHa5s2QcX9lb6q8Ns9OwDJOlBLXcAwIz10jd59RZMMELnzrj1tOz4Jszz1B1i4qrRaC
	 qU7uN/2C8iV15R2voBjZGRuAxH3ShCXELykKzqyL3ZDNRO66UorU7pqwQMg60/G3u4GmS
	 BiD2f7JiBQCe/c77TExcMmWVmCF4OE33CCIdkBI6O2vIevCvAGuNbyYHYSMtmqhRxLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541193;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=TCgb5VczcWQ1Dp3F7ELs9XqP2fto6yPEEIoTwB2s3a8=;
	b=uFD3NjIxHeNE75bbdVjwpvag5h7pS5jl4DkKMYo+CXQDWEfReAT4uEmTINBWKWQJjmcD
	 rJtT9Sbz8gWl2whGazyG0/kZaJ2IU9L0XwVflTToBmSMXmP3aIvsEkH0wMxmRaFYuO/3B
	 3htAcBszyITutimQs8DQqjMCvcoQQ5a5tGIG/WwOUs0fp36rYCInAE+I9Z4we9+VLXsc/
	 GY1VmpO4vIBIeGlsYu3trzVbN4ZW6oZMGVIpAGfnOca0LAx2Xdw3OlU9LcW6J8t1AX1KV
	 i9IO1dKBzBlOkSHJAaGQPbtYo2uHWmI4UR82iFqK6mou+DjYRHM1rhiYJ6MAX/maVEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AQ6wm+0H;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C643606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 17:26:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C643606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AQ6wm+0H
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2f07a960666so27922715ad.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 09:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795541192; x=1796145992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TCgb5VczcWQ1Dp3F7ELs9XqP2fto6yPEEIoTwB2s3a8=;
        b=AQ6wm+0HI/tZbJZBurneWRe5123KanwHUb4jJmoJ99xALeuR3sNr3IY6yhN7rPwofE
         a+cwkZq9QyGHY9L8zjHO8rGPXcZNlCzgZ2bunw+4fyI0IunK1wc8N8ZJuTPBao/gILmI
         hI61TNWDp1G+mQ3BfjHA64RYcdnRzvN8Ysjj3KN85NPnGttQHXcT4hHHQ1PR4Z4rTdAh
         grkaqdEXQRFSu/Yer1PPccCk/taImY6HyOo/dfM8+Fn/oUxy34ZQaZmoQc99toCp9sDX
         epZT3r3k1xYyNpodZm87/2LhtGGRvk4Db7qQLM9LteLoa0ArrC4kxO4FEEqaI/CyC0Mr
         4xGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541192; x=1796145992;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TCgb5VczcWQ1Dp3F7ELs9XqP2fto6yPEEIoTwB2s3a8=;
        b=qyJL6VQX4T/N246tsyG6gm7fM5BMxjObZXQWoyJe6x342Heqb8kr8lOsUmn3eBSNRJ
         DDlJamdGQNxEXpKOHA+ttGasQDgmWTIbG3y1cmlQ6Ahc2/PTmXwKewVWtIFLl3cJq9Gn
         IrG11SKB27NcaqbtdasTxB7RvVmWo0QvmocrfVcC41Oi0QY7rQ3+6f9t6TAp3Q/8TOfD
         lES6PIwmVcZjeyobWGkpZ6G8b5489UD7LHi/lVCt+/e7AkF8QDsdkYJqET6XTmuVD0LU
         aF0jfcdu+3ZR8L8a9hYY/50gMjLQrDBtUSrtksdWzT2nBggSQ/cxqZ+kVK2mb/O9mSut
         LFeA==
X-Gm-Message-State: APuU4Z+Q1DvtZpminB4aJ0/kvdXfgvh7L277/oJ+9qsx4QZ9eQlwsTxq
	NO9BfbUu9fVU8c41BUI2LfgBCnMWk4S/ST8qeDutAkY+pYEEynxkWvDs2HabwZVVo4k=
X-Gm-Gg: AZFdTZeq57gJSJb0kev86IML7slrIluKuELaKNobxxLvM4veS+tk/ebKr/GSdG0nt9H
	e10CT/kFczqZ4POwz/Ajap8jxVcagOeYqw6TaSHDYdx5dWzrl2dZOyqjow8gZ7yPZCosgovD23r
	7nxU298URHnu6Md3+JEmOmNTaduPk0P6q9yK2OFYRrFRCAXFG/Q1qo7G7cLmISl1fFPIdIpxHr8
	LdqksldxEcjzMM7XNy4dK5Se+uIVVB66HIl8cIQUAeZuO4NDZp1uvGIcPbUIKQWAJVjv03gJ4rs
	bbZ8UDt2a06VoeIXSGRcfPbIKKrlZyzGGP3gMoJCO5sCPjJ8RkASpKuZ6IyJR3C8xnWvuOBZ9Nn
	LfRv5r9vmzdcx6f1I0eKq+S7xnTMEyVjxkdlJji7rNVCSoVCSQxtoGrxi01CHoPJAEuybO8QwHK
	Zs33xO0vXbE4RoRlfIoKbMWJzMtVVVbP92P+Vjpdl0pNANPm9V7ReScRWOhZ1XOT7kcCa54clXH
	yDIDUIqNDbUcbKSzcmPOJ5rUd+X7z5XLubGB/KYLHMni3SBtzNCOZlAK052WOBuvQuLNgMbHhwx
	fJvI1RJdSnjw8YsDn6GbqKGyu/iog+bF
X-Received: by 2002:a17:902:d2cf:b0:2d9:599e:df95 with SMTP id d9443c01a7336-2f03ef44a68mr167262115ad.3.1795541191824;
        Tue, 24 Nov 2026 09:26:31 -0800 (PST)
Received: from x1.hsd1.wa.comcast.net ([2601:600:a482:7d70::b4f9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f04f8aca00sm63052795ad.38.2026.11.24.09.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:26:31 -0800 (PST)
From: David Westen <davidlwesten@gmail.com>
To: netdev@vger.kernel.org
Cc: mail@maciej.szmigiero.name,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Sergey Ryazanov <ryazanov.s.a@gmail.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Abdun Nihaal <nihaal@cse.iitm.ac.in>,
	M Chetan Kumar <m.chetan.kumar@intel.com>,
	David Westen <davidlwesten@gmail.com>
Subject: [PATCH net v2 0/3] net: wwan: iosm: send the host sleep message on every suspend
Date: Tue, 24 Nov 2026 09:26:24 -0800
Message-ID: <20261124172627.41847-1-davidlwesten@gmail.com>
X-Mailer: git-send-email 2.56.0
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

On platforms whose BIOS doesn't select D3L2, iosm tells the modem about
system suspend with the FORCE_SLEEP and FORCE_ACTIVE doorbells, which
the XMM7360 in a ThinkPad X1 Carbon 6th gen doesn't survive. Patch 3
always uses the ENTER_SLEEP/EXIT_SLEEP host sleep messages instead, as
discussed in the v1 review. Patches 1 and 2 fix two bugs in that
handshake that so far only D3L2 platforms could hit.

Changes in v2:
- New patches 1 and 2, for issues the AI review of v1 found.
- Patch 3: rewrite the commit message and remove the doorbell path with
  everything only it used (Loic).
- Patch 3: fix the Fixes: tag and the comment, and describe testing and
  hibernation in the commit message (AI review).

Tested on an XMM7360 with suspend-to-idle, including overnight. Not
tested on the XMM7560 or on a platform where the doorbells work.

v1: https://lore.kernel.org/r/20261122050039.861287-1-davidlwesten@gmail.com

The investigation and the patches were done with an AI coding assistant
(Claude Opus 5.5). We wrote the patches together, and I ran the tests.

David Westen (3):
  net: wwan: iosm: reset the host PM state when the sleep handshake
    times out
  net: wwan: iosm: fix the wait for the modem in the host sleep
    handshake
  net: wwan: iosm: always send the host sleep message on suspend

 drivers/net/wwan/iosm/iosm_ipc_imem.c     |  5 --
 drivers/net/wwan/iosm/iosm_ipc_imem.h     |  8 --
 drivers/net/wwan/iosm/iosm_ipc_irq.c      |  3 +-
 drivers/net/wwan/iosm/iosm_ipc_pcie.c     | 96 ++---------------------
 drivers/net/wwan/iosm/iosm_ipc_pcie.h     | 14 ----
 drivers/net/wwan/iosm/iosm_ipc_pm.c       | 43 +++++-----
 drivers/net/wwan/iosm/iosm_ipc_pm.h       |  7 --
 drivers/net/wwan/iosm/iosm_ipc_protocol.c |  7 +-
 drivers/net/wwan/iosm/iosm_ipc_protocol.h |  8 --
 9 files changed, 28 insertions(+), 163 deletions(-)


base-commit: af6737b9066832a2017c281159950ba92385ce00
-- 
2.56.0


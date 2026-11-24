Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795556661;
	b=gjucsxZPNP1Gh3VT614uiW8s1VgqniK2MrEcs9LD+N0jllY/daj1pJPDRmBP+LMMPDRm
	 QKz/2My7/bJHODEMo/+NtfjHefbPmrbFYDr3avg1j6tpiSuwSk1T27wThgZQFVGv40Byq
	 oCpII358m4FMtFdvQynLrceDmngxplG/LZSU6ONPaca+EeD/SgO56e3B+xVk6GtI9CgBC
	 aE7rcvVT2Jmmh9q4roHz6GrZPujnz+95tAx10X5A/EHgmtEdqbk5wf+NtCv2VluBngDk9
	 vsSkI4uWm+NVG0Gf6FzxDBu4D62AWqRquK7VeqeqRMl9slpVLOjc3xbYjcylo65/mGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795556661;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Subject:From:To:Cc:
	 Date:Message-ID:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Tkc3CsMiopw91DKs//TRkN8F86d4Ay9NdQg7kxZkaAA=;
	b=l1iPzNZOfbN8n0rx0VKz3UgMWIT0epgAurMxqXgpiFBvJR7XxipxQ6jERV94kSWkBJnh
	 OgWPyDbn+yTrfkH+zEQDQK5AYv1z2ayUXT0SOgjGtNeTdln/Wxp1WygNnlNxZRhgL7tml
	 GD6giTYtIBMplC+AqxM3heIANPWIa541HrtktC9AIMj74PLCcyOzZ557YjuYbCIpe4z/z
	 23pmCnREB8rHClYejo4u2AztO8E8eCNAhqZS2MwUUyLH1CxLio2JXhEueSEsM8j0tvFta
	 zuGVBxmA5Pa2A6SRmaNzMt+uhRYyQfwTDUj3NXNxuHO0BcC6ckTBD2VNPHIqmcT9NfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lWGdY+s3;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837EA606A69A
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 21:44:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 837EA606A69A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lWGdY+s3
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3b402824d07so3421828a91.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 13:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795556660; x=1796161460; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :message-id:date:cc:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tkc3CsMiopw91DKs//TRkN8F86d4Ay9NdQg7kxZkaAA=;
        b=lWGdY+s3W8bEq+kGmEIU31xT2WS9VkFYnFQdn4aubyCa6E1Q1MGt92xcJNgF/BbRyg
         pOSusDpJKAOFajsxVblu/KvR3aBa8PTgONjLWXWqyb7ffw7PHN4LMB5q4NmC3VqN1dUc
         alwDhAZeyB7o3FwOxRUj5ghEwpFrUfju2bzPBgXdfrU0FLw8LwQ3Hsx9Xj/PYfxQnR6r
         OEAn4SMCAueq9g5oftSBCsfzMyDodZMqWd+/0g1UQnz3ok0tMPdxf8B7q9wPGVAgPjLI
         P+1GXPeoZumeb8xblZZYIxd1RLParOD3wYgzFTV82FhZmmvDMjn9hkr81QAVwAKSHDI1
         kv6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795556660; x=1796161460;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :message-id:date:cc:to:from:subject:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tkc3CsMiopw91DKs//TRkN8F86d4Ay9NdQg7kxZkaAA=;
        b=ZNybqPbj5QFgxN335SMleS/fVML/jPO11upu8tZa6p+FClGUJTrGxM+h6vmkUwQFrU
         kdczKuaZMI0c3AhgGQzI/h3H6x2gcwU3nZCgx5nPl9dVyyAOAsxs9QHp8mkkusA+h6kr
         6M1R5L43jHetDwqm27reoURBl34OmlKISu3j38QgpCQknFcZ32wakKff9gFws5oERKRb
         TOJL9kQaeWiroXtpLFZ8WpYo/tGzmFEGs/P36/D81fo+Qt72XaQc3sOofrKAUgVzufu7
         9r6pk7FNlkw1MN5GKFsRtj4TikMIxiuFr5ymsuZ1Voj+GHTDJxTrtfCdRlGPMVxDPCnx
         ysOA==
X-Gm-Message-State: APuU4Z9jzYjxekg3/NjOCBtCxdUxazvN2/ZYmV7pxjZNer2HsJvXBiQ+
	idwK0t3+wRH2hcClPQNb31wncsOJ4NUwnoMQCeTnEEm8kDx323pnZmlbRnuITw==
X-Gm-Gg: AZFdTZfu9tcBfaPOVWMjzQ9KwZC9AYloC/2jy7+fzulDk0E4nP4HzQkVp5DPE0PN8Bp
	CRZT5NW/b1XTLbKICMbAYZ0QTIwOOBqkPM+Hy48bv8zFF+xOXoT77bTR5DYAH4s1JPY8Ej9IouX
	0ay/mnNzgo6D3UL3a5QKRhvesqBrotmSSxWHcB0j6Iu8LrXJ7ndfGQ306dosCdVm5egIA2sMwSa
	2EJLjnKvWg4R4YXP7SVSawZMJMhUGfXxgbDNwrdYc+7kA7R79m5bCScKSqKgkARzj4y380tXdGy
	RI7A1VHQNPO8nsvUcQueknGM6GFB7/Pcmg0Dq0W6rSSOo9lBbXO2bQMi3PuI9irdJDq7JEEV6nZ
	dycUYSo/SpFvpQ96YDd5YQ90+1xl8tMBLobg0dQ9vvOG2g8GgHU2lwrfkCfHNBdQaeFmJmCwuvy
	lm32sq5KKC53maRyy4DVmP0vm9o4n67ObSmTisQVyVZLMEaCRzsBKjd9zbIKCjQ02r3eIBnTfD1
	sqyPq/O2pnHBP/k6Q6fV4uDROKF6BHrJwGFF4fazxNbbA1OWjMpggz6bdDm0TC4HJRCZzJaoHy8
	vZIBO4YRQv+C+n2aFHmMPQWrgrWd505wzW3PHUf8k0xE7aE0HW5WWR6NK3a80QlBahSGTkBMZyQ
	aPxgPB3YhVRFm0jaGI1rCFWb52qlL4fMb21UteSZf2uhH2g==
X-Received: by 2002:a17:90a:d2c7:b0:3b4:a90:7f3a with SMTP id 98e67ed59e1d1-3b41c95da5bmr14269571a91.55.1795556659853;
        Tue, 24 Nov 2026 13:44:19 -0800 (PST)
Received: from ahduyck-xeon-server.home.arpa ([2605:59c1:38c:400:22f5:2de:b9c3:f27c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b776a14sm10541170a91.2.2026.11.24.13.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:44:19 -0800 (PST)
Subject: [net PATCH 0/3] fbnic: FW coredump fixes    
From: Alexander Duyck <alexander.duyck@gmail.com>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 horms@kernel.org, kernel-team@meta.com, kuba@kernel.org, pabeni@redhat.com
Date: Tue, 24 Nov 2026 13:44:18 -0800
Message-ID: 
 <179555657536.7867.497419917946087787.stgit@ahduyck-xeon-server.home.arpa>
User-Agent: StGit/1.5
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Fixes for reading and reporting the FW coredump.

Patch 1 limits TLV_MAX_DATA to the 4K page the firmware uses. On hosts
with 64K pages it was derived from PAGE_SIZE, so coredump reads asked
for more data than the firmware can return and failed.

Patch 2 stops the coredump info response handler from returning the
error the FW reports. The mailbox Rx path logged that as a message it
could not process, with a hex dump. The error still reaches the request
through the completion.

Patch 3 only lets a user request create a coredump. A dump taken for a
reported fault, such as a missed heartbeat, made the FW create one from
its current state and write it to flash, giving a crash dump for a FW
that had not crashed.

Patches 1 and 3 came from missed heartbeats on fleet hosts. A missed
heartbeat under memory pressure was reported as a FW fault and left a
coredump from FW that was still running. On an arm64 system with 64K
pages the coredump read for such a fault then failed. Patch 2 was found
while testing patch 3.

Testing was done in QEMU with the Terminus FW running in its own
emulator. Patch 1 was tested on x86 with the mailbox buffers sized as
on a 64K page host. Without the patch the coredump read failed, with
it the full dump was read back.

For patches 2 and 3 a FW fault was reported through the health
reporter. With patch 1 only, each report created a coredump. With
patches 1 and 3, no coredump was created, but each report logged
"Unable to process message: -2" and a hex dump. With all three applied
nothing was logged and no coredump was created.

---

Alexander Duyck (3):
      fbnic: Limit TLV_MAX_DATA to the firmware's 4K page
      fbnic: Do not report a FW coredump info error as a parse failure
      fbnic: Only create a FW coredump when the user asks for one


 drivers/net/ethernet/meta/fbnic/fbnic_devlink.c | 3 ++-
 drivers/net/ethernet/meta/fbnic/fbnic_fw.c      | 2 +-
 drivers/net/ethernet/meta/fbnic/fbnic_tlv.h     | 4 +++-
 3 files changed, 6 insertions(+), 3 deletions(-)

--


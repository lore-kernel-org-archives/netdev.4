Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.13.80.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795214601;
	b=fbDQf5Rx/wjUhmQsQIqz6JJQ2euvSokWflsLPlfuIGyoIJC8rLWmKp5X/LC60CpVvoBZ
	 HByqtgsQ0SqjOYiPPsTYPPehhNxMdbW2KrVujl0JUvWTAsKWEt5cATSv7DzFF9ulYKmNA
	 XJfk1ECiIdLWgkZi+pLIa6O+Tc43BWC4l8B8wvMOvUlb0YFTRfelOlv8eNngzxjepJE8B
	 4oXSP3AvlfNHkAqlUy43l38BRd/P/1F/4uHss+fO7igm1YYaOQd/bsDO4llW0u8lxQL4R
	 SY/VV+kxH+qEWfubGK7O91ZNotR4yT6V/kprkzWhgPTAd+KoW3CdMQZOT6aAZSohCcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795214601;
	h=DMARC-Filter:Received:DKIM-Signature:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Last-TLS-Session-Version;
	bh=3DG5zJYI4bk0cn71OCAq0KXTmjsN6G/9bGdpWXwzxBE=;
	b=5WI9AKmye50Dc0iHGqJs1we1QDvMxK5+xT614Li2BmEpHUYOlW9Coh3ckN3ZIB5ri5nl
	 ZPoDp46dVEBoktdEEXkBjeOHKk9w+aUfCmuxWSNBc8GNo6gx01Ow1vbL3WACqqgvpPEEc
	 17GIpXbXW4D7lbGSrhJud1T+/qG3MagxDLPVh6/+gY+n5iE9ABSxorQ28f/IOCzXQvMWf
	 UudMwFDlJ19Iuzwx7irog51cqusLHRuOS3SIy3jOLg5Ui2uSSoPpsNs8dat0JU4sOGv3/
	 fboNkCNhuLljnWt48yjZ17f77DGeq5h4We8BpqyFRuXdFKUgtyUjId91u2K9WZ1UWGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tipi-net.de;
	spf=pass smtp.mailfrom=tipi-net.de;
	dkim=pass header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=ozgXlMcE;
	arc=none smtp.remote-ip=194.13.80.246
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60A6606A6A4;
	Fri, 20 Nov 2026 22:43:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B60A6606A6A4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=ozgXlMcE
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8A3D4A023C;
	Fri, 20 Nov 2026 23:43:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1795214587; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=3DG5zJYI4bk0cn71OCAq0KXTmjsN6G/9bGdpWXwzxBE=;
	b=ozgXlMcE5PA6NUhIGtKRpQpp9Q0feeiCsP0ZDA6McYR+yYg5Mf0FUhDgDT/wmaMj/VKM6N
	GK04FNp/Kqls0IxudVx6Sx3lVkIMxp/leRF7ZADHYaYD163Up0+rlW/vwlXHuYRKPBcHXf
	ypz1EC55x2u6vEKg8hktxVOKuNs2P43K6+rKuagmRHsiIdVELixv1S2Wi2f3edoIiXoOdk
	pfSfU3tdN8PJ6CAhjpnTKDQbauK9d3i0Sq1uQ0msO7bv/8bwk46dw7SRiKLBucePWMrzzP
	kD7l6YRaiGXXWC0sfzwBkAhPxuqBVN8inoXmL7TqjcumKbYHbuFFADd2XQOZkQ==
From: Nicolai Buchwitz <nb@tipi-net.de>
Subject: [PATCH net v2 0/5] net: bcmgenet, systemport: DIM and Rx discard
 fixes
Date: Fri, 20 Nov 2026 23:42:34 +0100
Message-Id: <20261120-nb-genet-dim-stats-net-v2-0-1a7cece7dd1a@tipi-net.de>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNQQ6CMBBFr0Jm7Zi2RKyuvIdhQekUxsRC2ko0h
 Lvb4gFcvpn3/18hUmCKcK1WCLRw5MlnUIcK+rHzAyHbzKCEaqSUGr3BgTwltPzEmLoUsZBpTON
 sLeqLdpDDcyDH7734DlmA9neML/OgPpXKoo0c0xQ++/wid/nf0iJRoKyNOp+cJKH1LfHM5XW0B
 O22bV/7orGV1QAAAA==
X-Change-ID: 20261118-nb-genet-dim-stats-net-b6b6fd30398f
To: Doug Berger <opendmb@gmail.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Justin Chen <justin.chen@broadcom.com>, 
 Petri Gynther <pgynther@google.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nicolai Buchwitz <nb@tipi-net.de>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

Sashiko has flagged a few genet bugs over time. I'll work through them
as time permits, fixing the ones that seem worth it.

DIM on genet and systemport wants running totals but gets per-poll
counts, so it picks bogus profiles from the wrong numbers.

The series also fixes DIM getting stuck after a down/up or suspend and
resets the Rx discard count with the ring.

Patches 1-3 have been tested on a Raspberry Pi CM4. I don't have any
systemport hardware, but the bugs there are the same.

---
Changes in v2:
- genet: flush the DIM work instead of cancelling it, which also covers
  WoL suspend (Sashiko)
- genet: reset DIM before switching to running totals, so a stale sample
  can't wrap after a reopen (Sashiko)
- genet, systemport: run net_dim() before napi_complete_done(), so no
  DIM work can be queued after napi_disable()
- systemport: add the same DIM reset (Sashiko)
- systemport: the set_coalesce vs DIM work race is pre-existing and left
  for a separate patch
- Link to v1: https://patch.msgid.link/20261118-nb-genet-dim-stats-net-v1-0-13b275f1e088@tipi-net.de

---
Nicolai Buchwitz (5):
      net: bcmgenet: keep DIM from getting stuck after close or suspend
      net: bcmgenet: accumulate the DIM packet and byte counters
      net: bcmgenet: reset the Rx discard count with the ring
      net: systemport: restart DIM from the default profile on start
      net: systemport: accumulate the DIM packet and byte counters

 drivers/net/ethernet/broadcom/bcmsysport.c     | 20 ++++++++++++--------
 drivers/net/ethernet/broadcom/genet/bcmgenet.c | 19 +++++++++++++------
 2 files changed, 25 insertions(+), 14 deletions(-)
---
base-commit: 2a324a58a084c5cfd7e5a2f55e0786bee170a4a5
change-id: 20261118-nb-genet-dim-stats-net-b6b6fd30398f

Best regards,
--  
Nicolai Buchwitz <nb@tipi-net.de>


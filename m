Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795231944;
	b=wskbUF2Pzou9FCfBo44qRWG2JijUTS/enKYxC7WMgYzf/OMzUtFVtwYM3RicH9s/x5Ze
	 d+Q1sMPHOTZLcrIm994yuq79fJeGmpo8Sob5aqcso6RPWTp5rQ1gsSYtY1kfLufSA6fEx
	 MM0P6FxzssuvdTdc7rOfCHeUR/2K1liDVwvO7Lp0XsYlPYNWS9WY1C3VSvU+AXQ1GXXPS
	 ixhaV3CWilkRnTxwPkk66RKd6V7UohSQMR0K6Xkyvm8ptjEl2WxMYlMqlZqfzvoykVdZP
	 iXCIN5DY3C2fTTduh01F9lKUf90Dkag9QjPbr0PmorILMYEV/PUnfJTnLjeZPr7Eznw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795231944;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=j/ew5yBZmkGSdvEcPNdjjMJrzQhVkm8l/o1JHzT8kyI=;
	b=yKYHxCVvsy+4ibzpE6GeiOyYRYHqZsth9+VpSr1kwiiYNysn2oCoGGslkiNj4Bguz2cz
	 CtRboMl04IBe1qMGEgUxmhGYgx8ZdcD0hoUl+sKGppNzRH/bF4qf7nuYx5wrXlys8Qa7x
	 VXCxARuSsRKQFOo5PPNboDUb+e04+MIs/7E+Ut6eRRNFt7nHOeh8gL4X138qVAa2WMBCp
	 m1h/AvE/1L8kFt4KTxwFniSb4uNBAmBEascHjYfcwCORAIfJcW8ff2qvnaRHV6f825SzD
	 +UaN7SthjLjFCSwSyB7ByrWUb1L7j8L85ElzRT3xJz56ir0RoISnt1Gix49MoJxTUiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r5CYG7e4;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0132A606A685
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 03:32:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0132A606A685
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r5CYG7e4
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8b67f25e6e1so851991b3a.0
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 19:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795231937; x=1795836737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=j/ew5yBZmkGSdvEcPNdjjMJrzQhVkm8l/o1JHzT8kyI=;
        b=r5CYG7e4vCQ7zS3u895IIZEHs5DLDWMIPwHXQw51+nsRXW7jwYrSPqhBn36DmPx551
         q1d/QUUjP443EYbLK85cliMCAO5dPuIF1VcuiZJAC7NAjGdiYd3hL6F3kVyp9sJduVBD
         sWj3cMxpYLC1sQY3cD+Du85T6PQsuOQ3yOQ12o/NJoA6ionhFdYI1CTHvWRwQ2U43yTO
         tMDT7mUt+ftzXa5YacMIz+nq6Iemjue9NHugJGm+O5xVFq/Hl4bKGf1re1Ch5K9jkCOA
         pBm5unn9o3bp/jQx7NXonILxvvCffRXCq6r01PRNeFRBoRtLWGwEu/qsYAKDHtCxRhRT
         h/RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795231937; x=1795836737;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j/ew5yBZmkGSdvEcPNdjjMJrzQhVkm8l/o1JHzT8kyI=;
        b=pJow+4qdtM5XEQPeTjV3kw5e5q+UZ4sEa8bpnvIK5OsphWMhpdF+3RxyNjqCzSve32
         90IO50Vo4M3V+971kIgAvn94irWhVn93y4tUjnXj4nPKHfFd3oTxlaKxN37AaOh0gJtn
         fUQ/nhLSeKE8F9763O4HNvEz/A9hdXaNUvIaOGXyrk/8frQPFXlFjrMxJ5zA3+goN00V
         Q/IdOSAkE3xCnS+OlG+rB0QkzMUBoIeYfwGhL3T0nGJmRoeyRwVkFuk8yjYHP58sIrJ8
         z7HPR93Vzagh8MLfgtGQ29cUSQ4rDJropk99zhQVUz4St01lPfa6+KL/xbmZmoCJF/2R
         cimg==
X-Forwarded-Encrypted: i=1; AL+hErFF1uRUVKA/zd87WRBGw3HbNxrk9IdResirtADENANKmRui0jDgWwMbBdIOgo0vc/M6MT/yhDs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9EMowxIFN29DCRapJef15G85027x7Ynedd8u42XAnn8n4hxNkb
	aIbFDtGq3fzTZvkn0cibFAiwcdCVYp4bWaNOZa3JkiI6JLxC5ZaZRE4K
X-Gm-Gg: AZFdTZcA3/22p3Mu5JnV3+BuoOXzP6haD73dx3BVN+ZSK8jVclvIlWr1Jcp8lgLB7SO
	RdDTvkbmSnt7nju2oYaZUH3aMoGa+hWn3veywgBM0HCyAmmd8E5HqEHbLcVeJuhLXnDMLma5h40
	TlBmBDgPE2C8ngYmP79iyHu1BanWyaKuL3748WMzRpPyjKr3Ye2T9TrRh1I+P2HSMiS3XKfATe3
	/gooZ5Djg4mjwa04xDSg4xwhlfaCb7ibnilr2Wmvlrze/zljATwlCVUQToB56SnfX/K1mfPjnP6
	dIVfw9Y5DIOvCHOLG4nckGpYX5T+iS8O+BSiqQVyBvIhjZHLCSlkmBtkVX2vClzYszLLXRf4329
	RgFRUmOuFsmYSk+bWhmaQkiGs9j9PGOl52cEaLe95/dkio6DClJmRtgm+W4WxCizbSCqAOoBL/H
	53+s8hM3s9+lxBE6SLJ93P0H2b4AyZJwT1Dab4TfGaP/qybEDmr6/q7eMhfbEmPHrCsEPjK2FSD
	wqAsNnV2ODtTqfN3Nst+w5pfXlePILl0uSRDMS/kTHXEoFnZSX2bX4scm5v/gZhTGaNwb27AfVK
	ue4xXmOteHbujQYYz3+TWj9CIngWQeBfrw==
X-Received: by 2002:a05:6a20:430d:b0:3ef:ee8a:5201 with SMTP id adf61e73a8af0-4014a276b2amr5122456637.4.1795231937244;
        Fri, 20 Nov 2026 19:32:17 -0800 (PST)
Received: from localhost ([2a03:2880:7ff:3::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285c89dsm2271227b3a.13.2026.11.20.19.32.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 19:32:15 -0800 (PST)
From: Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
To: "David S. Miller" <davem@davemloft.net>
Cc: Alexander Duyck <alexanderduyck@fb.com>,
	Jakub Kicinski <kuba@kernel.org>,
	kernel-team@meta.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Bobby Eshleman <bobbyeshleman@meta.com>,
	Mina Almasry <almasrymina@google.com>,
	Dimitri Daskalakis <daskald@meta.com>,
	netdev@vger.kernel.org,
	Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
Subject: [PATCH net 0/4] eth: fbnic: queue stop fixes
Date: Fri, 20 Nov 2026 19:32:11 -0800
Message-ID: <20261121033215.1020506-1-dimitri.daskalakis1@gmail.com>
X-Mailer: git-send-email 2.52.1
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

From: Dimitri Daskalakis <daskald@meta.com>

AI uncovered some pre-existing issues with fbnic's queue stop handling.
If the idle wait fails in fbnic_queue_stop(), queues can be reset with
in-flight DMAs and completions. fbnic_queue_stop() did not wait for in-flight
xmits to complete before tearing down queues. And fbnic_wait_queue_idle()
waited on the wrong idle bits for Tx queues.

Patches 1 and 3 were verified on HW, and patch 4 was verified in QEMU.

Dimitri Daskalakis (4):
  eth: fbnic: restart queues in place when fbnic_queue_stop() fails
  net: add netif_disable_subqueue()
  eth: fbnic: wait for in-flight xmit in fbnic_queue_stop()
  eth: fbnic: wait for both TWQs of a Tx queue to go idle

 drivers/net/ethernet/meta/fbnic/fbnic_txrx.c | 84 ++++++++++++++++----
 include/linux/netdevice.h                    | 36 ++++++---
 2 files changed, 91 insertions(+), 29 deletions(-)

-- 
2.52.1


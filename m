Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794867987;
	b=CVL/RsGCv77LcMruKecvvLv8aEUHcX9sgsUbsaSjkWx97AB5szuv1X7y8dQEi80uv5Qd
	 ECItdCVkguayKbKe+d+mI0pV+6Ai6rivaZTseGvefN+a9j9KilHGDRgLeiNaMTzBNjbbV
	 o/3XQMJXD32nqpmu97Xze0KtSQMpsLbPQdQ5APQ7xIW3ZMWkIieiiDaW5DsF/hT5SwoHM
	 EfIWQ0C8/vB6lBVF3dsAb1/DYghvP8/OdvejyQ8GAXiLUizcawlmghenUJQ4+PWknAWb3
	 5PKBPJGY0zMZoyxZgPe1YEd+EaLzYlOUuFiysEHHvl0UuXkTLhPZCfwlT7i9ggj2SWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794867987;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=3SslE8qgO26XXBHOVGhvKn10x5qVEd0Ps4LIMSMCbA4=;
	b=D+Np21aifrH3XO9jdCl2hE+41v71hmWGkfBqlSHdKuv6Gb3haJTu3ftQdarfeIwKkzGe
	 7UskUctsBbFZeC7LKQvr40shhoavLFGuzJeL7zrpmJ4CTnyntrMh9UgBPiJPj9VHFvS3W
	 3v87F5u/Lhf8QjhTIDzGsaFrtxjUfVOBrKglYz1TB1jet+ljoEK8tgjFJPZuOFXTCtEEZ
	 KJChqqMzSvkyCwhE4pCSJgmoMlhzBC8YqzM23p+Ipn1xHwMzMW9YN3N0JMyAeIdxOcfc7
	 fv+bk9qnJpk5L/DAyw6ne2VCJt92LBN3cHjZ069WHUrZRpy9pNMy/MBa6TYytJSLT0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=amoT01zp;
	arc=none smtp.remote-ip=209.85.214.227
Received: from mail-pl1-f227.google.com (mail-pl1-f227.google.com [209.85.214.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F80606A32A
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 22:26:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94F80606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=amoT01zp
Received: by mail-pl1-f227.google.com with SMTP id d9443c01a7336-2ed1414df17so19234585ad.2
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 14:26:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794867986; x=1795472786;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3SslE8qgO26XXBHOVGhvKn10x5qVEd0Ps4LIMSMCbA4=;
        b=ajwGqtVn/NogVsdApqhZ4/upQYyyHU0nuam1L6sumoqvBeMgO9E+LL98ynZtOVdERr
         /sYuVCYY4HMuNdmUR1zpDf21wG/k3fBTMjNF7KBPlfo+DANTvCdvWeMnT+wY5EDoShqn
         ZfP8+ZYQvvn0AQQ68K9ztNdE+3L21b50QAuhxc6X/QrcSuoTjykOBTRPazLlahqe5+po
         v1ueX3U0i6VQDkV2q/eoqNFJeEgxAO8p8dpRbOks/CqQZodX9sNBJN8fU10WLIvs9p++
         Y9s02rw60xnWI8Y1nIYaa9OjilYNvzVaGoNmF8RtNcJ2eKsWrNZ44OMGgCo6x4KUc3QP
         Cwfg==
X-Gm-Message-State: APuU4Z+Le23dHw7oY/X5AgMdX+5hy+dAuZhB6ut8xLhurFE2K/aLkFjE
	SZYUpHbIpazo+VLaZK77w9GY7LbH2De3W58u/3CVlZhOoScjCMQWR9YbB6QcTdBeGQyRuAWfSbT
	MRgiTqNGDHvdJDZxWWWVXd2COKDHdSYLbTBm6QX5NR/6hxH2BtNrwFzWEema9kZs+gzqwhPM3B8
	MA0qexKAoSoisZWNCevE4iGxe32+XF7WCpjirlLcuiEGjwKgz6HUjLw380WNyYelCfufzIp9CKH
	B5/GO0+5D7mbaX3
X-Gm-Gg: AZFdTZcXJPEwlBXNsP7JCNOOL9sj5bMSDMLsJ6nXfZ6h/Vr33hhYaail6YPZYq+GlZO
	dvr9VFV6nn2uzUYkAxjP5cz6QJQ9aJSG+n1JvKZyDC3u7r2QL7MFFENjsFNdyDH+b8ZgtKjp1O8
	3LHD8QwYF3avFXjoJZ5qoJjFUSYqGD/ESOljmCa//yVZBF/QLwOPFLEdrgLQs0P7E3Alpi6+dDW
	GOJzK1FTbL6atfX4it9wsM2HQXIyN70Z7ZwY5WKYed8YfwqRMC46b+FRaJ3CFviRapDodEsvZjs
	4VEJ0uVelNZ6fMEvOZlj+hKJfyMiBP9I6AeBuU4ZSPvSKK11Vgm0swPLVPdZuedj5HCEYdvtNjq
	aoiSJ4G/g0elZSHWi52Sb0dTq++BAW5MRdDX0ydnFgJ4sneNdQh8emD+d4hVXXY1AGmolUp2ac7
	td+aZqdNxZ6fxn+zp8sWfLSP4uFe4leO1ovwpV5HKV
X-Received: by 2002:a17:90b:2d44:b0:3ab:413:49b6 with SMTP id 98e67ed59e1d1-3b1b0a38e14mr11972132a91.41.1794867985764;
        Mon, 16 Nov 2026 14:26:25 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1c3e09606sm3764982a91.3.2026.11.16.14.26.25
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 14:26:25 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36ecd5db581so4942725eec.0
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 14:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794867984; x=1795472784; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3SslE8qgO26XXBHOVGhvKn10x5qVEd0Ps4LIMSMCbA4=;
        b=amoT01zpW1QiyWV7iomzHY4VI3soQ9GJqEyg0fwZrUGc+2SAmFe7WWlkbH2pUYrzJV
         S23qsAOVfZRSxhqClj8gXxMtFBxcClMDWLGRSEevbZyVVCXzHgv+YHrk+cifXiBbpOij
         Jmm5hZM5UwAnBukIUdjljQrf5Gsy2oa9e9fcg=
X-Received: by 2002:a05:7300:f797:b0:378:d42c:5064 with SMTP id 5a478bee46e88-379676f55ecmr11977706eec.41.1794867983709;
        Mon, 16 Nov 2026 14:26:23 -0800 (PST)
X-Received: by 2002:a05:7300:f797:b0:378:d42c:5064 with SMTP id 5a478bee46e88-379676f55ecmr11977651eec.41.1794867982905;
        Mon, 16 Nov 2026 14:26:22 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm50176624eec.19.2026.11.16.14.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 14:26:21 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	netfilter-devel@vger.kernel.org (open list:NETFILTER),
	coreteam@netfilter.org (open list:NETFILTER)
Subject: [PATCH net-next 0/9] net: bgmac: add Northstar IPv4 TCP/UDP NAT flowtable offload
Date: Mon, 16 Nov 2026 14:25:10 -0800
Message-ID: <20261116222519.1416501-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

This patch series adds support for the Broadcom Northstar IPv4 TCP/UDP
NAT flowtable hardware called Flow Accelerator (FA). There is a second
generation called FA+/FA2 which will be added on top later on since it
builds upon the custom Broadcom tag.

Florian Fainelli (9):
  net: ethernet: bgmac: validate RX length against the DMA packet
    capacity
  netfilter: flowtable: reject non-host IPv4 packets before lookup
  netfilter: flowtable: retain offload ownership until deletion
    completes
  dt-bindings: net: describe the Northstar flow accelerator
  net: dsa: add Broadcom FA metadata and IPv4 exception paths
  net: flow_offload: allow drivers to validate and invalidate cached
    paths
  net: bgmac: add Northstar IPv4 TCP/UDP NAT flowtable offload
  net: add KUnit coverage for FA and flowtable path validation
  docs: net: document Northstar FA setup and NAT qualification

 .../bindings/net/brcm,bcm4708-fa.yaml         |   45 +
 .../bindings/net/brcm,bcm5301x-gmac.yaml      |   27 +
 .../ethernet/broadcom/bcm-ns-fa.rst           |  507 +++++
 .../device_drivers/ethernet/index.rst         |    1 +
 Documentation/networking/nf_flowtable.rst     |   13 +
 MAINTAINERS                                   |    8 +
 drivers/net/dsa/b53/Kconfig                   |   12 +
 drivers/net/dsa/b53/b53_common.c              |  427 +++-
 drivers/net/dsa/b53/b53_fa_test.c             |  102 +
 drivers/net/dsa/b53/b53_priv.h                |    6 +
 drivers/net/dsa/b53/b53_regs.h                |   39 +
 drivers/net/ethernet/broadcom/.kunitconfig    |   21 +
 drivers/net/ethernet/broadcom/Kconfig         |   35 +
 drivers/net/ethernet/broadcom/Makefile        |    1 +
 .../net/ethernet/broadcom/bcm-ns-fa-test.c    |  661 ++++++
 drivers/net/ethernet/broadcom/bcm-ns-fa.c     | 1901 +++++++++++++++++
 drivers/net/ethernet/broadcom/bcm-ns-fa.h     |   30 +
 drivers/net/ethernet/broadcom/bgmac-bcma.c    |    5 +
 drivers/net/ethernet/broadcom/bgmac.c         |   41 +-
 drivers/net/ethernet/broadcom/bgmac.h         |    2 +
 include/linux/dsa/brcm.h                      |   19 +
 include/net/dsa.h                             |    2 +
 include/net/flow_offload.h                    |   12 +
 include/net/netfilter/nf_flow_table.h         |    8 +-
 net/dsa/Kconfig                               |   20 +
 net/dsa/tag_brcm.c                            |  120 +-
 net/dsa/tag_brcm_test.c                       |  199 ++
 net/netfilter/Kconfig                         |   10 +
 net/netfilter/nf_flow_table_core.c            |   21 +-
 net/netfilter/nf_flow_table_core_test.c       |  171 ++
 net/netfilter/nf_flow_table_ip.c              |    4 +
 net/netfilter/nf_flow_table_offload.c         |   62 +
 net/netfilter/nf_flow_table_offload_test.c    |  129 ++
 net/netfilter/nft_flow_offload.c              |    6 +-
 .../kunit/configs/nf_flow_table.config        |    9 +
 35 files changed, 4651 insertions(+), 25 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/brcm,bcm4708-fa.yaml
 create mode 100644 Documentation/devicetree/bindings/net/brcm,bcm5301x-gmac.yaml
 create mode 100644 Documentation/networking/device_drivers/ethernet/broadcom/bcm-ns-fa.rst
 create mode 100644 drivers/net/dsa/b53/b53_fa_test.c
 create mode 100644 drivers/net/ethernet/broadcom/.kunitconfig
 create mode 100644 drivers/net/ethernet/broadcom/bcm-ns-fa-test.c
 create mode 100644 drivers/net/ethernet/broadcom/bcm-ns-fa.c
 create mode 100644 drivers/net/ethernet/broadcom/bcm-ns-fa.h
 create mode 100644 net/dsa/tag_brcm_test.c
 create mode 100644 net/netfilter/nf_flow_table_core_test.c
 create mode 100644 net/netfilter/nf_flow_table_offload_test.c
 create mode 100644 tools/testing/kunit/configs/nf_flow_table.config

-- 
2.53.0


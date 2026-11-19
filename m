Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795076639;
	b=irOBQXFN4yiGdky18+dHlOQhE+Fl4UCfcBTmWDRiDMTmBEgjxi5UbmFP66AENr19cs77
	 3JAyjYC7VlAXR/JH6/VaJYV1CE7WO+Y8klOkMPeBO/8CBvMpnsyGZ58YoVE6EuMOCfG8n
	 o/emDdWAJnIrEobsyJc5E2L/UKX1uf9kJ/IEd4s73JUNH1o2v5mU6DaZN0G++3eGbVeyw
	 IfHmWAHZjMax76rQtnD3qApdtG+1Zhmn1Ral1Qbm59wUZWjgIjroSe9gThgry4d/GTYXA
	 yKSpe9wAZuuwK6mSRMgTNdGGXXgd6+Rciac2lqSxPSX9aQynDQOVs2/fwV8FLa8dL2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795076639;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=48YdPFcu7k/F/1gLeNRWuBrzFZWBgAjvsA2zw+5FjaY=;
	b=nJuBbShYZpxvJnRv/Q/so1l8LNRBmi4/hCS8KBt4QW4spaXBG23kkCimaNkV5vWJdTYY
	 Y/wAuQy6gxpkVhpZBw6jolvVvPyLIX4NF6lctIKAhIBWVINTRUQOB4LGgj+DDFtwjeNZ3
	 anlc54+/3QF7jCIheASNp6iasnfv0DF9yF5Mf7O3PvgtVj1lnfDVTfOTSCWY92jz9zLD/
	 77fsptZK22pJfcROPE9QKaGY0AcgOGvaZgYJqU5LjyjN+O6tiWCudYP56zI4C+FAjFtk6
	 7WCby/oHDZ4oatdkM/huDq/bLdX5dl8pTNsPRHq1z/uq4PIhPHk0kymGiDzd3EuYLRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XuU92q8M;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97FC9606A320
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 08:23:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97FC9606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XuU92q8M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795076637;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=48YdPFcu7k/F/1gLeNRWuBrzFZWBgAjvsA2zw+5FjaY=;
	b=XuU92q8MkGxMeYOcgXQ/JqvWuQYPWvua6sJZumm6HmvPv+ul3rrlVhArA1Lh2nhJIHiioY
	bG5ve4mGgxsIpMD9nwuF7S3u6kiDrmz19lJzP8UbAcZcQ3wOesEhbOkuK2JtMzeduoqpUn
	kfn15+EfwfshC5SdjgWyiLLfutMdcPQ=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-633-7zpoSdcbPoqMob0FWUMk1A-1; Thu,
 19 Nov 2026 03:23:52 -0500
X-MC-Unique: 7zpoSdcbPoqMob0FWUMk1A-1
X-Mimecast-MFC-AGG-ID: 7zpoSdcbPoqMob0FWUMk1A_1795076629
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6586E180054C;
	Thu, 19 Nov 2026 08:23:48 +0000 (UTC)
Received: from poros-thinkpadp16vgen1.redhat.corp (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4541F1956088;
	Thu, 19 Nov 2026 08:23:42 +0000 (UTC)
From: Petr Oros <poros@redhat.com>
To: netdev-bot+sashiko@kernel.org
Cc: Petr Oros <poros@redhat.com>,
	anthony.l.nguyen@intel.com,
	davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com,
	edumazet@kernel.org,
	andrew+netdev@lunn.ch,
	netdev@vger.kernel.org,
	michal.swiatkowski@linux.intel.com,
	david.m.ertman@intel.com,
	pengpeng@iscas.ac.cn,
	przemyslaw.kitszel@intel.com,
	vinicius.gomes@intel.com,
	sridhar.samudrala@intel.com,
	aleksandr.loktionov@intel.com,
	horms@kernel.org,
	alexander.nowlin@intel.com,
	marcin.szycik@linux.intel.com
Subject: Re: [PATCH net 2/6] ice: skip per-VLAN promisc rules when default VSI Rx rule is set
Date: Thu, 19 Nov 2026 09:23:38 +0100
Message-ID: <20261119082339.674502-1-poros@redhat.com>
In-Reply-To: <179495967132.3136.6714105968141020753@kernel.org>
References: <20261113231225.1864810-1-anthony.l.nguyen@intel.com> <20261113231225.1864810-3-anthony.l.nguyen@intel.com> <179495967132.3136.6714105968141020753@kernel.org>
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
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

On Tue, 17 Nov 2026 23:54:31 +0000, netdev-bot+sashiko@kernel.org wrote:
> ice: skip per-VLAN promisc rules when default VSI Rx rule is set

All of these hold up and will be addressed in v5.

> [Severity: Medium]
> If only IFF_ALLMULTI is cleared, can a promiscuous VSI end up with no
> multicast subscription?

Yes. It happened before the patch as well, because promisc and allmulti
use the same ICE_MCAST_PROMISC_BITS rules, but the patch claims to fix
exactly this case. In v5 the allmulti branch of ice_vsi_sync_fltr() is
skipped while the VSI is promiscuous. The promisc path owns the
multicast subscription and reconciles it with IFF_ALLMULTI when promisc
is cleared. That also covers both flags changing in one pass, where the
allmulti branch would otherwise add the per-VID rules right before the
promisc branch makes them redundant.

> [Severity: Low]
> This isn't a bug, but the commit message does not mention this change to
> ice_clear_promisc().

Agreed. The v5 commit message describes the VLAN agnostic multicast
rule used while the VSI holds the DFLT rule and the clear of both
recipes in ice_clear_promisc(), and it no longer says that the DFLT
rule alone covers every VLAN.

> [Severity: Medium]
> Can leaving promiscuous mode now fail because of the FLU exhaustion this
> patch is meant to address?

Yes. In v5, if not all per-VID rules can be added again, the ones that
were added are removed, the VLAN agnostic rule stays as the multicast
subscription and the DFLT rule is removed anyway, so leaving promisc
does not depend on free rule space. The per-VID rules are also dropped
on promisc entry whenever the VSI holds the DFLT rule, not only when
the DFLT rule was installed in that pass.

> [Severity: Medium]
> Is this reached even when no DFLT rule was actually installed?

Yes, ice_set_dflt_vsi() returns 0 for a LAG with switchdev without
installing the rule. In v5 the per-VID rules are dropped only when
ice_is_vsi_dflt_vsi() is true.

> [Severity: Low]
> Separately, ice_vsi_clear_vlan_mc_promisc() above removes the per-VID
> ICE_SW_LKUP_PROMISC_VLAN multicast rules, vid=0 included, before this
> ice_set_promisc() call installs the VLAN-agnostic vid=0 replacement.

Right. In v5 ice_set_promisc() installs the VLAN agnostic rule first
and the per-VID rules are dropped after it.

> [Severity: Medium]
> The per-VID rule is skipped here for a DFLT VSI, but the conversion further
> down in ice_vlan_rx_add_vid() is not gated the same way:

Yes. v5 skips the vid 0 recipe swap in ice_vlan_rx_add_vid() while the
VSI holds the DFLT rule, so the VLAN agnostic rule stays in place.

> [Severity: Medium]
> Is the per-VID rule also skipped here when the eswitch owns the DFLT rule,
> rather than netdev promisc?

Yes. In v5 the replacement for 3/6 goes first and resyncs the uplink
after a switchdev session. It drops the multicast promisc rules, marks
allmulti as not programmed and forces a filter sync, so with
IFF_ALLMULTI set the sync installs the per-VID rules for the VLANs
added during the session. The resync takes ICE_CFG_BUSY like
ice_vlan_rx_add_vid(), so a VLAN added just before the DFLT rule is
removed is covered as well.

Regards,
Petr


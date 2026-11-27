Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795786575;
	b=WAeweRhO1ROECs2yBDGqkxJJRlWGRaOa01YM9c30a0BtlMKXCaXCgEdRYZA12+QFEaDb
	 NcpmV0RIw08g+xpTIqQ2YddCBgfYW95hSQamwgdwkYfUEjG+DnwxKm2aEN6WL4J1RWCG7
	 DGFX4iry6tJMLRLyKxlW0tGfCX85B6GGm/gb6GXWb+alSHEJW8U4NE/Mt0e/g3PCpLmiZ
	 1W9yyfueaX6SUwyOz4ZBDFAmB/d3iaKVrXWNOUQIkJRifNNPOs40xGs9KrhFl+NC39H3J
	 Za52479jnPE3c6yTLnAARXoa8ITKmWNyFmO9mn97X14pzgf+CeqcFao6USgL0y+9SOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795786575;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Scanned-By;
	bh=2zwWUQKFRVBnh1e/1qUGMrFHMuSVTqbKwP//bS3MkZc=;
	b=1+XMfdsER+3wsuSWk/gO1xo0O2RwgLxlXg59vFlKRY14J8c/X5jFfaZgF3vhjwhrnXPV
	 MsK0LkQQxzLk+FbhN9ZS25ovMx1VGhTI94Y2276DwdLIGffJubmGI4o70lGbOxEd18wkr
	 DuqoWuQ+TWdwJfjoiRUzzfdDnt/mOlceb0KBo34NHhw9K7CBbQo9ReXQjmFJCkPJeNaa6
	 DRxNZiNvtnYDBGnguzgmmPZTsghl/E0ccfwYQHzJp0MxHLYHl9OdHaseOY8Uuwf/yLnf3
	 SUcYpFqYv4FCqT+/BQSiuuSiTL3MHC52cX79c+wbEbDDUHccG47vCHGaXcV00AQOQ2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Xp8ZM7UT;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F027606A31E
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 13:36:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F027606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Xp8ZM7UT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795786574;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2zwWUQKFRVBnh1e/1qUGMrFHMuSVTqbKwP//bS3MkZc=;
	b=Xp8ZM7UT0SYSkOeKbE/eY4O/DuigJ2+zCRvE3tFigPe5vxxIYHox1N9N32T1UEm26U7fjQ
	WkbyP2SGMTxO4rcSlRUp+eKvUh7puH0Y/W/Lh3U8fSNt8JeVaAYtt4PkVFSMmRS28d7FvG
	R62D0KZSFGv0SjjNq+mRX3BsKd95U4w=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-517-ggFaK2BCNQu3bFHK3zP90g-1; Fri,
 27 Nov 2026 13:36:10 +0000
X-MC-Unique: ggFaK2BCNQu3bFHK3zP90g-1
X-Mimecast-MFC-AGG-ID: ggFaK2BCNQu3bFHK3zP90g_1795786567
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5C9A71955F03;
	Fri, 27 Nov 2026 13:36:07 +0000 (UTC)
Received: from [100.91.101.41] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 73D041956052;
	Fri, 27 Nov 2026 13:36:01 +0000 (UTC)
Message-ID: <70c538f4-3878-4da4-bcb3-a96b67cedf52@redhat.com>
Date: Fri, 27 Nov 2026 14:36:00 +0100
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v5 4/4] ice: use a VLAN agnostic multicast promisc
 rule pair for PF VSIs
To: Petr Oros <poros@redhat.com>, netdev@vger.kernel.org
Cc: Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
 Simon Horman <horms@kernel.org>,
 Michal Swiatkowski <michal.swiatkowski@linux.intel.com>,
 Grzegorz Nitka <grzegorz.nitka@intel.com>,
 Paul Menzel <pmenzel@molgen.mpg.de>,
 Wojciech Drewek <wojciech.drewek@intel.com>,
 Marcin Szycik <marcin.szycik@linux.intel.com>,
 Martyna Szapar-Mudlaw <martyna.szapar-mudlaw@linux.intel.com>,
 Alice Michael <alice.michael@intel.com>,
 Jacob Keller <jacob.e.keller@intel.com>,
 Jesse Brandeburg <jbrandeb@kernel.org>, Patryk Holda
 <patryk.holda@intel.com>, Rinitha S <sx.rinitha@intel.com>,
 Aaron Ma <aaron.ma@canonical.com>, intel-wired-lan@lists.osuosl.org,
 linux-kernel@vger.kernel.org
References: <20261127085714.1207361-1-poros@redhat.com>
 <20261127085714.1207361-5-poros@redhat.com>
Content-Language: en-US
From: Ivan Vecera <ivecera@redhat.com>
In-Reply-To: <20261127085714.1207361-5-poros@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

On 11/27/26 09:57, Petr Oros wrote:
> An allmulticast or promiscuous PF VSI with VLANs is subscribed to
> multicast with an ICE_SW_LKUP_PROMISC_VLAN rule pair for every VID, and
> each rule takes an entry of the switch lookup table (FLU), which has 32K
> entries for all PFs of the device. A port of a vlan_filtering bridge is
> allmulticast, so a wide trunk (vid 2-4094) over several such ports
> overruns the table. Firmware then rejects Add Switch Rules with ENOSPC,
> the trunk of the last port is only partly installed, and the default VSI
> (DFLT) Rx rule fails to install when a port turns promiscuous:
> 
>    ice 0000:5c:00.1: Failed to set VSI 14 as the default forwarding
>                      VSI, error -5
>    ice 0000:5c:00.1 ens1f1: Error -5 setting default VSI 14 Rx rule
> 
> Subscribe PF VSIs with the VLAN agnostic pair (ICE_SW_LKUP_PROMISC, vid
> 0) only. Drop the per-VID handling from ice_vlan_rx_add_vid() and
> ice_vlan_rx_kill_vid(), and stop clearing the multicast rules in
> ice_eswitch_resync_uplink(), whose queued sync now reconciles them. The
> pair matches multicast on every VLAN. VLAN pruning still limits what it
> delivers to the VLANs of the VSI, and with pruning off, as for the DFLT
> holder, it delivers on every VLAN. The subscription now follows
> IFF_PROMISC and IFF_ALLMULTI in one place, so clearing allmulti no
> longer unsubscribes a promiscuous VSI unless another VSI holds the DFLT
> rule, and a failed DFLT install does not remove it before the retry.
> ice_set_promisc() adds the Rx and the Tx rule one at a time, so a rule
> left by an earlier failure does not keep the other one from being added.
> 
> A trusted VF that holds the DFLT rule no longer gets through it the
> multicast on VLANs the PF is not a member of, because the promisc recipe
> has a higher priority than the default one. It keeps what its own
> multicast promisc rules match.
> 
> The overrun was observed on a machine in real use, and the allmulti
> problem was found by the Sashiko review of v4. The overrun reproduces on
> an E810-C (FW 8.1.1, ICE COMMS package 1.3.55.0) without kernel changes:
> 
>    for p in $P0 $P2 $P3; do
>            ip link add br-$p type bridge vlan_filtering 1
>            ip link set br-$p up
>            ip link set $p master br-$p
>            bridge vlan add vid 2-4094 dev $p
>    done
>    ip link set br-$P0 promisc on
> 
> With the per-VID pairs a trunked port took 12292 FLU entries, the third
> bridge vlan add failed part way and the promisc on logged the errors
> above. With this patch a trunked port takes 4104 entries, all three
> trunks fit with 20387 of the 32768 entries free, and the DFLT rule
> installs. The FLU numbers come from a test-only debugfs file that issues
> Get Resource Allocation (AQ 0x0204). Also tested with multicast to
> joined and unjoined groups on member and non-member VLANs, with promisc
> and allmulti changed in every order, with VLANs added and removed while
> allmulticast, with a trusted promiscuous VF, and with the DFLT install
> made to fail by a test-only change. No kernel selftests cover this.
> 
> Fixes: 1273f89578f2 ("ice: Fix broken IFF_ALLMULTI handling")
> Fixes: 43fbca02c2dd ("ice: fix lost multicast packets in promisc mode")
> Signed-off-by: Petr Oros<poros@redhat.com>
> ---
> v5:
> - Reworked after the Sashiko review of the v4 pull. PF VSIs now always
>    use the VLAN agnostic multicast pair, and the per-VID multicast rules
>    and their handling in ice_vlan_rx_add_vid() and ice_vlan_rx_kill_vid()
>    are gone.
> - The multicast subscription is reconciled from IFF_PROMISC and
>    IFF_ALLMULTI in one place, so clearing allmulti keeps the subscription
>    of a promiscuous VSI unless another VSI holds the DFLT rule.
> - ice_set_promisc() adds the Rx and the Tx rule separately.
> - New title, was "ice: skip per-VLAN promisc rules when default VSI Rx
>    rule is set".
> - Added the Fixes tag for 43fbca02c2dd.
> - Dropped the Reviewed-by and Tested-by tags because of the rework.
> 
> v4:https://lore.kernel.org/all/20260708125755.706263-2-poros@redhat.com/
> v3:https://lore.kernel.org/all/20260701133601.2118382-2-poros@redhat.com/
> v2:https://lore.kernel.org/all/20260622113428.2565255-2-poros@redhat.com/
> v1:https://lore.kernel.org/ 
> all/89efbea9831175e6f57e9fe8557f7a0e48e050b7.1781786935.git.poros@redhat.com/

Reviewed-by: Ivan Vecera <ivecera@redhat.com>


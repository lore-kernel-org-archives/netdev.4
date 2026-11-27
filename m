Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795786535;
	b=CjIxSmzpBQZp3dFuP1/vIhw2pBLoy6VYhzWkF/+w0aDlbJTQlzV/YD+DpMRGZUKTjdVh
	 zM3VldsVZFkkAcS64F6Kpo1/Al5/YpNGZm/heu1lyzGTp21XPIhQoM3hKM2I1OoBs7oyg
	 dZkMbC4lczOmAA68w/R3x0nHlxIgjosmiwFRHBSS4xOgGeciRjS5AHYBn7GeiV5+pbqz9
	 HaXJVbDP/fcgV7RSXQk921nIyd9Si1xhtvRvNah0TtxHY/AXkg085AkK92exU3fKo2nXq
	 mgRDl5HSrY6WoBC5UVZEQxQ3Q4N6IJ5/9dMSZmMEem7C87jc/aQXYe6JZ67E3wHzUaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795786535;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Scanned-By;
	bh=LZsrkdjo3wiY3MXe7EcjLmqxXpAd3Z9lQW5+QTgaLK0=;
	b=o7XWL85k7TuRWS/IqobZgn+p8iCJHXt4Col3GOLxKAfGwnJTzIdHJijXDPTiQhFTuNxg
	 MrgUtfo8EIJVxiMCCH46pNXLvSpB/nKKJ+geCEM4wBseCQGYLXRiW2nGkEJLr8MSleHrH
	 LNSVr8Pldi2Hi+kFaYDmnsrUzBsKdrkrt6dqePiWLRuudjXDwuI+NsrgwfECRTKcRJVJM
	 fSC8r9IR5tkSTLxcjM05C7TdxiXRI1GGAXuX7OkbL20lGeiHUvQgpmh3xESYlk9ZO7X94
	 w8KmVPUh5ASZLwG7VVX5dnnjBNTw6UA/+LxuomQdem6fvPC3en9VDPZIWj1xMNHeW2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DhyCikVe;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48CDD606A31C
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 13:35:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48CDD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DhyCikVe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795786534;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LZsrkdjo3wiY3MXe7EcjLmqxXpAd3Z9lQW5+QTgaLK0=;
	b=DhyCikVeMgGe5xiKauiJD49zV2AZm1BhT1M4LZvjjfPbePejZo1Ti0WeEqwF71lar3OIx5
	xadB7I1N/Cs+CONBgIVHO6PIsjChcDW+4qmQB3+8/EaKuheVWUW9Sm6k8+TgQcmqxtkymV
	PBT+63YplmnVW2afJ8n6LzJmrKlpevU=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-547-0W-AsCljPnWmi9wQUUBBaw-1; Fri,
 27 Nov 2026 13:35:28 +0000
X-MC-Unique: 0W-AsCljPnWmi9wQUUBBaw-1
X-Mimecast-MFC-AGG-ID: 0W-AsCljPnWmi9wQUUBBaw_1795786525
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4338918004F6;
	Fri, 27 Nov 2026 13:35:25 +0000 (UTC)
Received: from [100.91.101.41] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 52F6B30000E5;
	Fri, 27 Nov 2026 13:35:19 +0000 (UTC)
Message-ID: <eaa97495-15aa-4675-89c4-6c491bed6cd8@redhat.com>
Date: Fri, 27 Nov 2026 14:35:18 +0100
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
Subject: Re: [PATCH net v5 3/4] ice: resync uplink filters after a switchdev
 session
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
 <20261127085714.1207361-4-poros@redhat.com>
Content-Language: en-US
From: Ivan Vecera <ivecera@redhat.com>
In-Reply-To: <20261127085714.1207361-4-poros@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

On 11/27/26 09:57, Petr Oros wrote:
> A switchdev session leaves the uplink filters out of sync with its
> netdev. ice_eswitch_setup_env() removes the multicast promisc rules and
> the address filters, and ice_eswitch_release_env() removes the default
> VSI (DFLT) Rx rule that a promiscuous uplink needs. ice_set_rx_mode()
> ignores the uplink during the session and nothing syncs it when the
> session ends, so these are not installed again, and flag changes made
> meanwhile are lost.
> 
> Let the eswitch own the uplink promisc configuration during a session.
> While the new ICE_VSI_ESWITCH_UPLINK bit is set, ice_vsi_sync_fltr()
> leaves it alone. When the session ends, after is_running is cleared,
> ice_eswitch_resync_uplink() clears the bit and queues a full filter
> sync, which programs the uplink from the netdev flags. Also subscribe a
> promiscuous VSI to multicast when it already holds the DFLT rule, and
> enable VLAN pruning on every promisc off, because it can be off without
> our DFLT rule after a session or with LAG.
> 
> This does not restore the uplink VLAN filters that
> ice_eswitch_setup_env() removes, a separate problem that now also shows
> when promisc is cleared after a promiscuous session.
> 
> Found by AI code review, starting with the Sashiko review of v4, and
> reproduced on an E810-C (FW 8.1.1, ICE COMMS package 1.3.55.0) without
> kernel changes:
> 
>    ip link set $PF promisc on
>    devlink dev eswitch set pci/$BDF mode switchdev
>    echo 1 >/sys/class/net/$PF/device/sriov_numvfs
>    echo 0 >/sys/class/net/$PF/device/sriov_numvfs
> 
> after which unknown unicast no longer reaches the PF, and with this
> patch it does again. Also tested on that E810-C with promisc changed
> before, during and after sessions, allmulti across a session, and PF
> resets and driver removal during sessions. LAG and switchdev setup
> errors were not tested. No kernel selftests cover this.
> 
> Fixes: 1a1c40df2e80 ("ice: set and release switchdev environment")
> Fixes: 2571a3fa6251 ("ice: Prohibit rx mode change in switchdev mode")
> Fixes: 5c07be96d8b3 ("ice: Avoid setting default Rx VSI twice in switchdev setup")
> Fixes: 776fe19953b0 ("ice: block default rule setting on LAG interface")
> Signed-off-by: Petr Oros<poros@redhat.com>

Reviewed-by: Ivan Vecera <ivecera@redhat.com>


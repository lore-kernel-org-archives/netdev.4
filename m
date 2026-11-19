Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795077389;
	b=eDOLcaqFilxCIIDpNMcBGOyXG22/CWqf9MLcHLlP2Id9yu+Q9ToBT9hdeuGGDwPr9L2M
	 eraiH2vOudTZKwfZiXCRalS0mMcn22ODKfUwMlPnRy+GC3jCjamuSpjNrtEFYqbDn5M/T
	 lie6JWM/kzduVqwBQ79oA2S2NbSYRNu+9X0avRuNUkoHKunH6Fd14G37j3cEDT2Qpkhii
	 2qoX7GLHAfCoG3XpaoY3XlCO+r0OLR+AqcJllM/77FdSLSC99pekJawhVCPW9M94HXOHk
	 Y5U6jQUAejmTjfq8uvAHAtVToHSwQA4bd8oS4ET5CAbCW1BvjX/ct0sdjMSj4EBJSjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795077389;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=MXqeIGr5zD4kbR/v9rvAoc7G3pU5tfOdM9LQF5zCWdk=;
	b=H73Ak+6wf9UWZIHsTjgmGW9tgj/gErNhEuYr4O34sBts+xdl7e4D00K/Z9i1jZu5hpzM
	 dxZeEvkeRAjmc94Al9c4CCU4LHu6SEW9CzjlucAFihjzwU+4HpTELePpgDp0I6iB/DViM
	 l52oVnHoD6JxOHs/i4LaBH+WsDo1yeWIh4CgIJuNDgOgfsJ6qKoDVzrxlR2hnyZLGuz3l
	 h1tCGylsIMhdXNUWuNZ6dRb1cQJhYLC3Tv+dZLblZSma6RBWcWtji1o4XlgVgJGohh32O
	 As9WpwMgFteuzyyN4gdSyUtrZ4KDsGqJtHVas5hZfRTKZTSY5uho8z/YtLbgwgRZyTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BrGEbtA1;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3317C606A320
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 08:36:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3317C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BrGEbtA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795077387;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MXqeIGr5zD4kbR/v9rvAoc7G3pU5tfOdM9LQF5zCWdk=;
	b=BrGEbtA17HGtENnaw8gA3CHoHX+LrXhLSS9JUN4pfaS9wmKJ7dsgma8/lJng9B5HPglM++
	fFd+dtza1HP6+S9Jf5kwVHOA4O/Spkog8jQPDm8ol0a9iRDwb769PelXM8KQ04oyi9Q8mC
	5icGRZLPo55voW/HAPeaRSIwEflqleI=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-489--nn25H-7OB6BT2UGphRkEw-1; Thu,
 19 Nov 2026 03:36:22 -0500
X-MC-Unique: -nn25H-7OB6BT2UGphRkEw-1
X-Mimecast-MFC-AGG-ID: -nn25H-7OB6BT2UGphRkEw_1795077380
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B0A4519560A6;
	Thu, 19 Nov 2026 08:36:19 +0000 (UTC)
Received: from poros-thinkpadp16vgen1.redhat.corp (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6733D589;
	Thu, 19 Nov 2026 08:36:14 +0000 (UTC)
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
Subject: Re: [PATCH net 3/6] ice: preserve uplink DFLT Rx rule on switchdev release
Date: Thu, 19 Nov 2026 09:36:06 +0100
Message-ID: <20261119083610.677491-1-poros@redhat.com>
In-Reply-To: <179495967304.3136.16113490698897758196@kernel.org>
References: <20261113231225.1864810-1-anthony.l.nguyen@intel.com> <20261113231225.1864810-4-anthony.l.nguyen@intel.com> <179495967304.3136.16113490698897758196@kernel.org>
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
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

On Tue, 17 Nov 2026 23:54:33 +0000, netdev-bot+sashiko@kernel.org wrote:
> ice: preserve uplink DFLT Rx rule on switchdev release

All four are right, and they have one cause. ice_set_rx_mode() ignores
the uplink while switchdev runs, so vsi->current_netdev_flags is stale
after the session, and nothing schedules a filter sync on teardown.
Keeping the DFLT Rx rule based on the live netdev->flags does not fix
that.

v5 drops this approach. The patch is replaced by "ice: resync uplink
filters after a switchdev session", which moves to the front of the
series. ice_eswitch_release_env() removes the DFLT Rx rule as before,
and after the session the uplink is resynced. The multicast promisc
rules are dropped, IFF_ALLMULTI is cleared in current_netdev_flags,
ICE_VSI_PROMISC_CHANGED and the MAC filter change bits are set and a
filter sync is scheduled, so ice_vsi_sync_fltr() programs the uplink
from the netdev flags as they are when it runs.

> [Severity: Medium]
> Does the "same value" claim in this comment still hold if promisc changes
> concurrently?

No. In v5 the comment and the second read of netdev->flags are gone.

> [Severity: High]
> Does this leave vsi->current_netdev_flags out of sync with the hardware
> filter state?

Yes, both cases are reachable. With the forced sync the promisc branch
runs with the current flags in either case. The promisc off branch now
enables VLAN pruning (with NETIF_F_HW_VLAN_CTAG_FILTER) also when the
VSI does not hold the DFLT rule, because the session leaves pruning
disabled. The err_def_tx unwind in ice_eswitch_setup_env() removes the
DFLT Rx rule unconditionally again and resyncs too.

> [Severity: Medium]
> Can a concurrent promisc change be lost between this check and the point
> where is_running is cleared?

Yes. In v5 the resync is scheduled after is_running is cleared, so a
change made before that is picked up by the sync, and a change made
after that goes through ice_set_rx_mode() again.

> [Severity: Medium]
> Does the uplink still lose its multicast promisc subscription after the
> session?

Yes, and the address filters as well, because ice_eswitch_setup_env()
unsyncs the unicast and multicast lists. The forced sync in v5 installs
the multicast subscription and syncs both lists again.

Regards,
Petr


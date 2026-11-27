Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795786465;
	b=n56Bni7xX3lHhKQxzBFtSTGj4/i+9QyT+2/nyxTS+OyuioHKozImUf8VI81/d0zCKppF
	 Z3dXG36TS7hVJzWne0kpzjiC7jHbVPCACkowFJ4vrGN1hx9XDRFyGJdbRtQYSlt8GXMAv
	 PjhSd4cT1E3rlqMNjGPG1HiaREdSycWnI4WrSPfTypAwJ5OOp4uTBKMG8A0CTp4XvEeOO
	 iNrB3fyXDaH5v8i3LtOW7HzZGdPUg1nlqRdlLOwIs/SqmIUmHODSXnzO6xgJB0sblbEtn
	 E5Xkf4vlTGSk3bLYlAeL23aDciGbDCEKMeFJ2ZU5D5lAxxGQUUyKNzmE9oplDGeRrUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795786465;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Scanned-By;
	bh=hQK1Qvervs1OAOhCCxOUr4dL6b3RgURGSMAbo5aH1Sk=;
	b=0zuf2NRxZqk5n6kVA15dVHXiC8Eaw2AFrsOa+0IUhG3V+scpq7Y7XMqHxjpgd/tjTEgW
	 pLW//qIFXe1NQul5RCTvdw1Zk77uof9Izqr1zEPwPvBDjgcsf1pMJuKSjkGYXZYEPtaFo
	 e7TyBFSHV76BykfEGi/If3Gvh3tRX8wPKAGYIsXpKlmfuLKfm0rFihOZNc5l/tRfEwVaG
	 fTHF2r6hdK0iw9bHVQcUWcfQPSaTSfIMtyHRNJ5PvL8TseRBhUOuynj0MFm8XtEEO/TTN
	 /ECahUYilcuT134TaTvECSTpgk/xi/Bm7BXpPcSoVjbju6ZBxMB+Zk9LGlVIAoD3I8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JdbcX1a0;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31DCF606A31E
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 13:34:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31DCF606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JdbcX1a0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795786464;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hQK1Qvervs1OAOhCCxOUr4dL6b3RgURGSMAbo5aH1Sk=;
	b=JdbcX1a0ahecQFBRzE8XQUoPqIban2L0nFJ42In76M+YaDtB4c799mZDfR6uVbel9WMd6H
	VJt3zCY5KZD6K8rdtYHS9oUwhf1dWj/s5RnyrNwlhedRQ/fGlVC6taM8j54ZrCBugcbiGn
	EJxSnWGUapLUcomvg1102GTo5kK1qnM=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-61-jPo4byX3N5SVBAflMNu0Zw-1; Fri,
 27 Nov 2026 13:34:19 +0000
X-MC-Unique: jPo4byX3N5SVBAflMNu0Zw-1
X-Mimecast-MFC-AGG-ID: jPo4byX3N5SVBAflMNu0Zw_1795786456
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3EDEF1955E97;
	Fri, 27 Nov 2026 13:34:15 +0000 (UTC)
Received: from [100.91.101.41] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A9C0218004F7;
	Fri, 27 Nov 2026 13:34:08 +0000 (UTC)
Message-ID: <c7708854-5a47-46a1-bca7-df3ba03ff85f@redhat.com>
Date: Fri, 27 Nov 2026 14:34:07 +0100
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
Subject: Re: [PATCH net v5 1/4] ice: stop the service task before the PF is
 unloaded
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
 <20261127085714.1207361-2-poros@redhat.com>
Content-Language: en-US
From: Ivan Vecera <ivecera@redhat.com>
In-Reply-To: <20261127085714.1207361-2-poros@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

On 11/27/26 09:57, Petr Oros wrote:
> Commit 8a37f9e2ff40 ("ice: move ice_deinit_dev() to the end of deinit
> paths") moved the service task stop and the cancel of the AdminQ event
> waiters from after ice_free_vfs() to the end of ice_remove(). Since then
> a queued or running service task can still walk pf->vsi[] while
> ice_remove_arfs(), ice_unload() and ice_deinit() free the aRFS filters,
> the netdev, the LAG and the VSIs. A last run that takes longer than a
> timer period also arms the service timer again after the stop at the
> end has deleted it, and the timer then fires after the PF is freed.
> 
> Stop the service task and cancel the waiters after ice_free_vfs() again.
> The stop in ice_deinit_dev() stays and deletes a timer armed by the last
> run. As before that commit, a devlink flash that is still running when
> the driver is removed fails, at the latest when its next AdminQ wait
> times out.
> 
> Found by AI code review. Validated on an E810-C (FW 8.1.1, ICE COMMS
> package 1.3.55.0) with a test-only 12 s delay in ice_sync_fltr_subtask()
> after it took the VSI pointer, armed right before a promisc change and
> rmmod ice. Without this patch KASAN reports a slab-use-after-free in
> ice_vsi_fltr_changed() on the freed main VSI, and the kernel then faults
> in call_timer_fn() on the timer function of the unloaded module. With it
> rmmod waits for the run and nothing is reported. Also tested by removing
> the driver during switchdev sessions and with four VFs bound to iavf. No
> kernel selftests cover this.
> 
> Fixes: 8a37f9e2ff40 ("ice: move ice_deinit_dev() to the end of deinit paths")
> Signed-off-by: Petr Oros <poros@redhat.com>
> ---
> v5:
> - New patch. The uplink resync in patch 3 queues a filter sync when a
>    switchdev session ends, and a session that still runs when the driver
>    is removed ends in ice_remove().
> ---
>   drivers/net/ethernet/intel/ice/ice_main.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/intel/ice/ice_main.c b/drivers/net/ethernet/intel/ice/ice_main.c
> index 47c6798c97e8f1..6dede87b78944f 100644
> --- a/drivers/net/ethernet/intel/ice/ice_main.c
> +++ b/drivers/net/ethernet/intel/ice/ice_main.c
> @@ -5387,6 +5387,9 @@ static void ice_remove(struct pci_dev *pdev)
>   		ice_free_vfs(pf);
>   	}
>   
> +	ice_service_task_stop(pf);
> +	ice_aq_cancel_waiting_tasks(pf);
> +
>   	if (!ice_is_safe_mode(pf))
>   		ice_remove_arfs(pf);
>   
> @@ -5407,7 +5410,6 @@ static void ice_remove(struct pci_dev *pdev)
>   	ice_deinit_hw(&pf->hw);
>   
>   	ice_deinit_dev(pf);
> -	ice_aq_cancel_waiting_tasks(pf);
>   	set_bit(ICE_DOWN, pf->state);
>   }
>   

Reviewed-by: Ivan Vecera <ivecera@redhat.com>


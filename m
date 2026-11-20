Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795151746;
	b=0tm8rcwqr9IKTWSggW0bAQ5TyqbQ+QGDZK4twhqRKeIk4tZSBSqi7ZBaeOmYPzXHUpiG
	 S067NWF8Fv30p9Z+qfvyS7a1YAMhew5EkKHusT7T2GbLL2y5movLoQgHJI/v9x76254td
	 vpFTimJ4S6OVSoKROfrvz0MKH/mePJk+qhVIBDUiz3whpf9XehrwDvzwWaXiviBHnCVnE
	 7W5reraxb3OQOB3HcpkUPWuP5ZgGQeHa669K/VToN73/8Jfx6CasJAnqh3LDgSTJxJi24
	 51/+2jc9ZrXqzEFzrW5t1chTKPEAje5TyaiHNpMNfEgjeBHe8K6uypflT6DJ3ldBFzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795151746;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:X-DetectorID-Processed:
	 Content-Type;
	bh=OBFe9a1ax+LoX2ldqXyZmb0vKomvBHvBbLX1K+sXGKE=;
	b=OSs46AKqjttbKBqJtwzQQmGWC8ZAXQsOsZV5hOcbcFqxdu/FGk2xor89phNOCbhGmcJL
	 1oRnJXQjMHaGiJP1a9R1L4nyQgvwuWyxYBQw9A2W2OK6zQb47rbSkyriVHktOrsW8wFKy
	 vd78+0WP7ON4XfGU9TYP1Bixjn0qVcaujXU+yGmsePS40RBd6IPaSFIjIBK5XmyKiNAnU
	 zH9pbRdnWrhe/yCEurpw9rvNKfk/sHkCvXNeFn0RhM+YWbk2gLXYfTfdsmF4LXRb+P6jj
	 1DV5y0Dz7krThhAFz0+3jY5/xaecIylSjWr+/eNlkHtuo2xLuuYerhd+GxZNOfq7e9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=balMSwki;
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F411C606A326
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 05:15:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F411C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=balMSwki
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3b40f4d4b5dso267982a91.1
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 21:15:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795151745; x=1795756545;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OBFe9a1ax+LoX2ldqXyZmb0vKomvBHvBbLX1K+sXGKE=;
        b=ex7fC8wQne5kHstKuqbIizrTfe4kr6S8xAcwY6K36uD60fBWeByt/5BnmImfTtZTNV
         AOwmZz242+WRVhUZK55QikFDvMU3ff9hzChEoHHJOqWSQnZp1hsUPwlVQsz/2qWYqqFc
         iO7gg9Da2iStdSQ59ycXK0fNddPPjCjKqkXze/y0f7OOctXRqzCxizpzD3rLpPQD1Od5
         WHJ3u2Myva06PakqgWTpicE74k7NjXEwFdDy7aMjt0XR/tf9c1wO/kVWSSKCvIDWI0BM
         rQ+uJ90BtVpM2TjCgxDtGa0c51H7TYehj/x6YgdECYxIozx1n8FTJIHZw9c0uWdy1g9T
         84pQ==
X-Forwarded-Encrypted: i=1; AL+hErFLWdvlWhhtBlOHJvzPQgrSooS9gI4X79DLwl6XWmCOY2zJixO6cLGDwLAHh5tH7+gJ9+Ww910=@vger.kernel.org
X-Gm-Message-State: APuU4Z8XhNFdhEnahvn12pcUogv7+WuuDILU3/80lIQLFn1NaW26I+W1
	bhhLKjkqloJLV8sPM6byvNQJcjkPuGRldd0lM5bcgFdsJHYuAx06RGVQMPmZojmQC/n7GPUPPnx
	5CUZWGdjpSkYjAsr4wuumGeZIG91s02K4X8r/K8QBzDhGHXaiDplFyWSS5dtYMIdv2aeq6VHHcu
	Pv7Fh7qd4OhYz415Jtz+G1tyHKhlrXsr1MGvpigw/sJ+rEqk7heGgfhHlohpnz22TXfZZnPAAij
	wZkUypW3w==
X-Gm-Gg: AZFdTZd/wbg2Hz+cW6TRrq4tJth6l8B1uUhAo424kstkTnV4WWJXZWbiLqug/AstKsO
	ouKapVZen6sEXbcTruqCH0jO6vpZIz4wUcSkcIr7WVpnVhS9ouLJ5YdAAkjDJu2/0itPZZACGBr
	VHS6MLmGixbUNpdeMkgd5EzDeLjsErQDp8NZJv6pPebiakPlarO/hBYFj3qMUdrA1YiqaxL5u5P
	m+XVpxlEy+7QTF9zBQPAfcoH+AMR6k/WfjMVLjOkLXLpS43j7vyUOVaWJxvwxXWFhYE0eK1wEjT
	298DQZtPEPTCq4J9RhpfFKo1wP6kf1v4viHxQfyB+nMFWt3M3mwOFraReQ3WJVUIsOKOJ1R6EH7
	2Ckn7lGBiep1HoHnuKs2Yzr5XxrQg57J8NvQq8oZrgXHFpHFYFw43zkto3cRrMdr7yzwq61UB/4
	jSf2Fe8L4ZLl8DILKW5IiDv1LgkWEKW+ma8PMW
X-Received: by 2002:a17:90a:ec88:b0:3b3:b0f4:1bed with SMTP id 98e67ed59e1d1-3b41c8d4855mr1578945a91.19.1795151745155;
        Thu, 19 Nov 2026 21:15:45 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b405960cd1sm2411251a91.2.2026.11.19.21.15.44
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Nov 2026 21:15:45 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7d2cba05824so362006137.1
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 21:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795151743; x=1795756543; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OBFe9a1ax+LoX2ldqXyZmb0vKomvBHvBbLX1K+sXGKE=;
        b=balMSwkiS5tUn19zYyTOj8t4v2TZxnClI/2Wa2++jYE98CPrGWWyP3jTGoLaOpxBOv
         q7OM2tb3cVZKT4ZV7AEV0ynOyoIk3fGsnvNUO6BWs6FlHl5yaKLv0BnZ3vCfM28tjRZD
         QxeO/991/hrLvITwOTNCnzsrddcDt6bG5iuNw=
X-Forwarded-Encrypted: i=1; AL+hErHSiINc+W7YIjOVBE+BV1pDUrnTlABYHnSLgZDWhFDlWPTEVHOJ6oCUn+7O2tdw9jsX6CcNqLE=@vger.kernel.org
X-Received: by 2002:a05:6102:3709:b0:7cc:1274:aba3 with SMTP id ada2fe7eead31-7d739444ee1mr761388137.22.1795151743529;
        Thu, 19 Nov 2026 21:15:43 -0800 (PST)
X-Received: by 2002:a05:6102:3709:b0:7cc:1274:aba3 with SMTP id
 ada2fe7eead31-7d739444ee1mr761377137.22.1795151743035; Thu, 19 Nov 2026
 21:15:43 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116140653.1685797-10-vikas.gupta@broadcom.com> <179510815141.3136.11040952527486167006@kernel.org>
In-Reply-To: <179510815141.3136.11040952527486167006@kernel.org>
From: Vikas Gupta <vikas.gupta@broadcom.com>
Date: Fri, 20 Nov 2026 10:45:31 +0530
X-Gm-Features: Aa3M54rWV5ls16aXkicUneQcVSOneiFDT8rdL_g9nOJB1HFQNT_EPOiYzVO3iFQ
Message-ID: <CAHLZf_vtPWxpB1nKdrtyxgnR-_hF-b0n_GYVXa+YKtxvNt=vbw@mail.gmail.com>
Subject: Re: [PATCH net-next v8 09/10] bnge: add aRFS flow steering ndo support
To: netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	bhargava.marreddy@broadcom.com, rahul-rg.gupta@broadcom.com, 
	vsrama-krishna.nemani@broadcom.com, rajashekar.hudumula@broadcom.com, 
	dharmender.garg@broadcom.com, ajit.khaparde@broadcom.com
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="00000000000003c2000660ae56ad"

--00000000000003c2000660ae56ad
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

We see a couple of valid comments and will send v9.

Thanks,
Vikas

On Thu, Nov 19, 2026 at 10:39=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wr=
ote:
>
> Thank you for your contribution! Sashiko AI review found 6 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 5
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] bnge_rx_flow_steer() lets network traffic create dynamic aRFS
>   NTUPLE filters.
> - [Low] The commit message's closing note does not match the code.
> - [Low] In the expire loop of bnge_cfg_ntp_filters()
>   (bnge_filter.c:834-835), the return value of=E2=80=A6
> - [Low] The locked expire re-check in bnge_cfg_ntp_filters() does not
>   cover a bnge_rx_flow_steer() hit on an existing filter for the same=E2=
=80=A6
> - [Low] bnge_cfg_one_usr_fltr() (bnge_filter.c:660-664) now writes
>   ntp_fltr->l2_key and l2_filter_id under=E2=80=A6
> - [Low] On a queue change, bnge_ntp_fltr_retarget() (bnge_netdev.c:3248)
>   commits the new queue with WRITE_ONCE(fltr->base.rxq, rxq_index) and=E2=
=80=A6
>
> --
>
> bnge: add aRFS flow steering ndo support
>
> This adds an ndo_rx_flow_steer implementation for bnge. It creates aRFS
> NTUPLE filters from incoming flows and inserts them into the shared NTUPL=
E
> hash table. Firmware programming and aging through rps_may_expire_flow()
> are deferred to sp_task, which the periodic timer queues with the new
> BNGE_RX_NTP_FLTR_SP_EVENT.
>
> > Note that, if the L2 filter is freed before sp_task programs the rule,
> > the captured firmware id is stale. The NTUPLE alloc either fails (id
> > gone) or binds to a recycled id for a different filter. The rule is
> > then dropped, or it stays until it ages out.
>
> [Severity: Low]
> Is this note still accurate? bnge_cfg_ntp_filters() never programs the id
> captured in bnge_rx_flow_steer(). Before every install it looks the id up
> again from the stored key:
>
>         l2_id =3D bnge_lookup_l2_filter_from_key(bn, &fltr->l2_key);
>         if (l2_id =3D=3D BNGE_FLTR_ID_INVALID) {
>                 bnge_del_ntp_filter_rcu(bn, fltr);
>                 continue;
>         }
>         fltr->l2_filter_id =3D l2_id;
>
> L2 filters are only freed under netdev_lock. That covers bnge_set_rx_mode=
()
> through ndo_set_rx_mode_async, close/teardown, and the ethtool delete pat=
h.
> sp_task also holds netdev_lock, so the "binds to a recycled id for a
> different filter" case doesn't look reachable. The note seems to describe
> an earlier version of the patch.
>
> The message also leaves out several behaviour changes to the existing
> ethtool n-tuple path:
>
>   - bnge_fltr_match() now compares l2_key instead of l2_filter_id
>   - bnge_cfg_one_usr_fltr() now refreshes l2_key under ntp_fltr_lock
>   - bnge_get_all_fltr_ids_rcu() and bnge_get_one_fltr_rcu() now filter on
>     bnge_is_usr_fltr() instead of fltr->flags
>   - bnge_del_ntp_filter_rcu() now uses hlist_del_init_rcu()
>
> Could the commit message be updated to match the code and mention these
> changes?
>
> > diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_filter.c b/drivers=
/net/ethernet/broadcom/bnge/bnge_filter.c
> > index e2dc3a34cad33..a0a8aebad20b6 100644
> > --- a/drivers/net/ethernet/broadcom/bnge/bnge_filter.c
> > +++ b/drivers/net/ethernet/broadcom/bnge/bnge_filter.c
>
> [ ... ]
>
> > @@ -642,7 +657,11 @@ static void bnge_cfg_one_usr_fltr(struct bnge_net =
*bn,
> >       if (fltr->type =3D=3D BNGE_FLTR_TYPE_NTUPLE) {
> >               ntp_fltr =3D container_of(fltr, struct bnge_ntuple_filter=
, base);
> >               l2_fltr =3D bn->vnic_info[BNGE_VNIC_DEFAULT].l2_filters[0=
];
> > +             /* bnge_rx_flow_steer() can already run and match this ru=
le */
> > +             spin_lock_bh(&bn->ntp_fltr_lock);
> >               ntp_fltr->l2_filter_id =3D l2_fltr->base.filter_id;
> > +             ntp_fltr->l2_key =3D l2_fltr->l2_key;
> > +             spin_unlock_bh(&bn->ntp_fltr_lock);
>
> [Severity: Low]
> Does ntp_fltr_lock actually serialize this write against
> bnge_rx_flow_steer()?
>
> The first match in bnge_rx_flow_steer() goes through
> bnge_lookup_ntp_filter_from_idx(). That function walks the bucket under
> rcu_read_lock() only:
>
>         hlist_for_each_entry_rcu(f, head, base.hlist) {
>                 if (bnge_fltr_match(f, fltr))
>                         return f;
>         }
>
> With this patch, bnge_fltr_match() reads l2_key.dst_mac_addr and
> l2_key.vlan with plain loads.
>
> bnge_open_core() sets BNGE_STATE_OPEN and enables interrupts before it
> calls bnge_cfg_usr_fltrs(). An RX softirq on another CPU can therefore ru=
n
> set_rps_cpu()->bnge_rx_flow_steer()->bnge_fltr_match() while this code
> writes l2_key, and the two paths share no lock.
>
> The lock here only orders the write against the match loop in
> bnge_insert_ntp_filter(). Would KCSAN flag this as a data race? On a MAC
> change across close/open, can the reader see a torn key and return a user
> filter's sw_id to the RPS core? If the lock is only meant to cover
> bnge_insert_ntp_filter(), could the comment say so?
>
> [ ... ]
>
> > @@ -715,3 +734,105 @@ void bnge_clear_usr_fltrs(struct bnge_net *bn)
> >               }
> >       }
> >  }
> > +
> > +void bnge_cfg_ntp_filters(struct bnge_net *bn)
> > +{
>
> [ ... ]
>
> > +     /* Free the old HW rule; reinstall it below on the new queue. */
> > +     list_for_each_entry_safe(fltr, tmp, &update_list, base.list_node)=
 {
> > +             list_del_init(&fltr->base.list_node);
> > +             /* If the free fails the rule stays on the old queue. It =
is not
> > +              * retried, so a firmware that keeps failing is not hit o=
n every
> > +              * tick.
> > +              */
> > +             if (bnge_hwrm_cfa_ntuple_filter_free(bn->bd, fltr))
> > +                     continue;
>
> [Severity: Low]
> What happens to the software state when this free fails?
>
> bnge_ntp_fltr_retarget() has already committed the new queue before
> firmware is touched:
>
>         WRITE_ONCE(fltr->base.rxq, rxq_index);
>         WRITE_ONCE(fltr->flow_id, flow_id);
>         smp_mb__before_atomic();
>         set_bit(BNGE_FLTR_RXQ_UPDATE, &fltr->base.state);
>
> bnge_hwrm_cfa_ntuple_filter_free() also sets BNGE_FLTR_FW_DELETED before =
it
> sends the HWRM request.
>
> If HWRM_CFA_NTUPLE_FILTER_FREE fails, the firmware rule still steers to t=
he
> old rfs_ring_tbl_idx. But fltr->base.rxq now holds the new queue, and
> FW_DELETED is set even though the rule is still live.
>
> >From then on, bnge_rx_flow_steer() calls for this flow and target hit th=
e
> READ_ONCE(fltr->base.rxq) =3D=3D rxq_index check in bnge_ntp_fltr_retarge=
t()
> and never queue a reprogram. rps_may_expire_flow() is also evaluated
> against the new queue's flow table, not the ring the hardware is using.
>
> The comment accepts that the rule stays on the old queue. Should the old
> rxq be restored and FW_DELETED cleared on failure, so that software still
> matches what firmware has programmed?
>
> > +             clear_bit(BNGE_FLTR_FW_DELETED, &fltr->base.state);
> > +             list_add(&fltr->base.list_node, &install_list);
> > +     }
>
> [ ... ]
>
> > +     list_for_each_entry_safe(fltr, tmp, &expire_list, base.list_node)=
 {
> > +             list_del_init(&fltr->base.list_node);
> > +             /* Decide again under ntp_fltr_lock: the scan ran without=
 it and
> > +              * the firmware calls above can take long. Use the rxq an=
d
> > +              * flow_id that bnge_rx_flow_steer() writes under it. Unl=
ink
> > +              * here too, so a flow cannot be retargeted onto a filter=
 that
> > +              * is about to be freed. The firmware free comes after th=
e
> > +              * unlock.
> > +              */
> > +             spin_lock_bh(&bn->ntp_fltr_lock);
> > +             if (test_bit(BNGE_FLTR_RXQ_UPDATE, &fltr->base.state) ||
> > +                 !rps_may_expire_flow(bn->netdev, fltr->base.rxq,
> > +                                      fltr->flow_id, fltr->base.sw_id)=
) {
> > +                     spin_unlock_bh(&bn->ntp_fltr_lock);
> > +                     continue;
> > +             }
>
> [Severity: Low]
> Does this re-check cover a bnge_rx_flow_steer() hit on this filter for th=
e
> same rxq?
>
> In that case bnge_ntp_fltr_retarget() returns early and writes no state:
>
>         if ((fltr->base.flags & BNGE_ACT_NO_AGING) ||
>             READ_ONCE(fltr->base.rxq) =3D=3D rxq_index)
>                 return false;
>
> bnge_rx_flow_steer() then drops ntp_fltr_lock and returns
> fltr->base.sw_id. set_rps_cpu() in net/core/dev.c records that id only
> after the ndo returns, outside ntp_fltr_lock:
>
>         rc =3D dev->netdev_ops->ndo_rx_flow_steer(dev, skb, rxq_index, fl=
ow_id);
>         ...
>         WRITE_ONCE(rflow->filter, rc);
>
> Suppose this re-check runs inside that window. RXQ_UPDATE is clear and
> rps_may_expire_flow() still sees the old rflow state. The filter is
> unlinked and freed in firmware, and its sw_id bit is released. The core
> then stores a dead sw_id in rflow->filter.
>
> The rflow then looks active, so set_rps_cpu() skips the ndo. The flow run=
s
> without a hardware rule until the slot goes stale, and the dead sw_id can
> alias a reused id.
>
> Hitting this needs a packet of the flow to arrive on a queue other than
> the one the rule targets. One example is after the failed retarget free
> described above.
>
> The comment above says the locked re-check keeps a flow from being
> retargeted onto a filter that is about to be freed. Doesn't that only
> hold when the rxq changes and RXQ_UPDATE is set?
>
> > +             hlist_del_init_rcu(&fltr->base.hlist);
> > +             spin_unlock_bh(&bn->ntp_fltr_lock);
> > +
> > +             bnge_hwrm_cfa_ntuple_filter_free(bn->bd, fltr);
> > +             bnge_del_ntp_filter_rcu(bn, fltr);
>
> [Severity: Low]
> Can this leak the firmware ntuple filter? The return value of
> bnge_hwrm_cfa_ntuple_filter_free() is ignored. bnge_del_ntp_filter_rcu()
> then clears the sw_id bit, decrements ntp_fltr_count and kfree_rcu()s the
> object anyway.
>
> bnge_hwrm_cfa_ntuple_filter_free() resets base.filter_id only when the
> send succeeds:
>
>         rc =3D bnge_hwrm_req_send(bd, req);
>         if (!rc)
>                 fltr->base.filter_id =3D BNGE_FLTR_ID_INVALID;
>         return rc;
>
> If HWRM_CFA_NTUPLE_FILTER_FREE fails, the rule stays programmed in
> firmware, but the only copy of its handle is freed. Nothing can free the
> rule until the VNIC/L2 contexts are torn down. Meanwhile the orphaned rul=
e
> keeps steering the old flow, and the released sw_id can be handed to a ne=
w
> filter.
>
> The update loop above checks the same call and keeps the rule on failure.
> Should the expire path handle failure the same way? bnxt_en has the same
> pattern.
>
> > +     }
> > +#endif
> > +}
>
> [ ... ]
>
> > diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c b/drivers=
/net/ethernet/broadcom/bnge/bnge_netdev.c
> > index b71e427d3ba10..0e7c506af402c 100644
> > --- a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
> > +++ b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
>
> [ ... ]
>
> > @@ -3226,6 +3235,146 @@ static int bnge_set_features(struct net_device =
*dev, netdev_features_t features)
>
> [ ... ]
>
> > +static int bnge_rx_flow_steer(struct net_device *dev, const struct sk_=
buff *skb,
> > +                           u16 rxq_index, u32 flow_id)
> > +{
>
> [ ... ]
>
> > +     new_fltr->flow_id =3D flow_id;
> > +     new_fltr->base.rxq =3D rxq_index;
> > +     rc =3D bnge_insert_ntp_filter(bn, new_fltr, idx);
> > +     if (!rc) {
> > +             bnge_queue_sp_work(bn, BNGE_RX_NTP_FLTR_SP_EVENT);
> > +             return new_fltr->base.sw_id;
> > +     }
>
> [Severity: Medium]
> Can remote traffic fill the ntuple table that ethtool rules rely on?
>
> The aRFS filters created here share bn->ntp_fltr_bmap and the hash table
> with administrator ethtool rules. The bitmap is sized bd->max_fltr
> (BNGE_MAX_NTUPLE_FLTRS), and no slots are reserved for BNGE_ACT_NO_AGING
> rules.
>
> A remote peer can open many TCP connections to a local listener that read=
s
> from them. With RFS enabled, each socket's flow reaches this function
> through set_rps_cpu(). Unconnected UDP does not record rxhash, so this
> needs TCP or connected sockets.
>
> Once the bitmap is full, bnge_add_ntuple_cls_rule()->
> bnge_insert_ntp_filter() fails:
>
>         bit_id =3D bitmap_find_free_region(bn->ntp_fltr_bmap,
>                                          bn->bd->max_fltr, 0);
>         if (bit_id < 0) {
>                 spin_unlock_bh(&bn->ntp_fltr_lock);
>                 return -ENOMEM;
>         }
>
> There is a second failure mode. bnge_fltr_match() ignores the filter type=
,
> and the bnge_toeplitz() index matches the hardware RSS hash. A live aRFS
> entry for a full-mask 5-tuple therefore makes bnge_add_ntuple_cls_rule()
> fail with -EEXIST for that exact flow, including a drop rule meant to sto=
p
> it:
>
>         fltr =3D bnge_lookup_ntp_filter_from_idx(bn, new_fltr, idx);
>         if (fltr) {
>                 rcu_read_unlock();
>                 rc =3D -EEXIST;
>                 goto err_free_fltr;
>         }
>
> Each new flow also costs a GFP_ATOMIC allocation in softirq and an HWRM
> call in sp_task under netdev_lock.
>
> bnxt_en uses the same shared bitmap design, but this patch is the first t=
o
> let traffic insert into the bnge table. Should the number of aRFS filters
> be capped below max_fltr, or part of the table be reserved for user rules=
?
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261116140653.1685797-1-vikas.gupta%40broadcom.com

pw-bot: cr

--00000000000003c2000660ae56ad
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIVVQYJKoZIhvcNAQcCoIIVRjCCFUICAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
ghLCMIIGqDCCBJCgAwIBAgIQfofDCS7XZu8vIeKo0KeY9DANBgkqhkiG9w0BAQwFADBMMSAwHgYD
VQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSNjETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UE
AxMKR2xvYmFsU2lnbjAeFw0yMzA0MTkwMzUzNTNaFw0yOTA0MTkwMDAwMDBaMFIxCzAJBgNVBAYT
AkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBS
NiBTTUlNRSBDQSAyMDIzMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAwjAEbSkPcSyn
26Zn9VtoE/xBvzYmNW29bW1pJZ7jrzKwPJm/GakCvy0IIgObMsx9bpFaq30X1kEJZnLUzuE1/hlc
hatYqyORVBeHlv5V0QRSXY4faR0dCkIhXhoGknZ2O0bUJithcN1IsEADNizZ1AJIaWsWbQ4tYEYj
ytEdvfkxz1WtX3SjtecZR+9wLJLt6HNa4sC//QKdjyfr/NhDCzYrdIzAssoXFnp4t+HcMyQTrj0r
pD8KkPj96sy9axzegLbzte7wgTHbWBeJGp0sKg7BAu+G0Rk6teO1yPd75arbCvfY/NaRRQHk6tmG
71gpLdB1ZhP9IcNYyeTKXIgfMh2tVK9DnXGaksYCyi6WisJa1Oa+poUroX2ESXO6o03lVxiA1xyf
G8lUzpUNZonGVrUjhG5+MdY16/6b0uKejZCLbgu6HLPvIyqdTb9XqF4XWWKu+OMDs/rWyQ64v3mv
Sa0te5Q5tchm4m9K0Pe9LlIKBk/gsgfaOHJDp4hYx4wocDr8DeCZe5d5wCFkxoGc1ckM8ZoMgpUc
4pgkQE5ShxYMmKbPvNRPa5YFzbFtcFn5RMr1Mju8gt8J0c+dxYco2hi7dEW391KKxGhv7MJBcc+0
x3FFTnmhU+5t6+CnkKMlrmzyaoeVryRTvOiH4FnTNHtVKUYDsCM0CLDdMNgoxgkCAwEAAaOCAX4w
ggF6MA4GA1UdDwEB/wQEAwIBhjBMBgNVHSUERTBDBggrBgEFBQcDAgYIKwYBBQUHAwQGCisGAQQB
gjcUAgIGCisGAQQBgjcKAwwGCisGAQQBgjcKAwQGCSsGAQQBgjcVBjASBgNVHRMBAf8ECDAGAQH/
AgEAMB0GA1UdDgQWBBQAKTaeXHq6D68tUC3boCOFGLCgkjAfBgNVHSMEGDAWgBSubAWjkxPioufi
1xzWx/B/yGdToDB7BggrBgEFBQcBAQRvMG0wLgYIKwYBBQUHMAGGImh0dHA6Ly9vY3NwMi5nbG9i
YWxzaWduLmNvbS9yb290cjYwOwYIKwYBBQUHMAKGL2h0dHA6Ly9zZWN1cmUuZ2xvYmFsc2lnbi5j
b20vY2FjZXJ0L3Jvb3QtcjYuY3J0MDYGA1UdHwQvMC0wK6ApoCeGJWh0dHA6Ly9jcmwuZ2xvYmFs
c2lnbi5jb20vcm9vdC1yNi5jcmwwEQYDVR0gBAowCDAGBgRVHSAAMA0GCSqGSIb3DQEBDAUAA4IC
AQCRkUdr1aIDRmkNI5jx5ggapGUThq0KcM2dzpMu314mJne8yKVXwzfKBtqbBjbUNMODnBkhvZcn
bHUStur2/nt1tP3ee8KyNhYxzv4DkI0NbV93JChXipfsan7YjdfEk5vI2Fq+wpbGALyyWBgfy79Y
IgbYWATB158tvEh5UO8kpGpjY95xv+070X3FYuGyeZyIvao26mN872FuxRxYhNLwGHIy38N9ASa1
Q3BTNKSrHrZngadofHglG5W3TMFR11JOEOAUHhUgpbVVvgCYgGA6dSX0y5z7k3rXVyjFOs7KBSXr
dJPKadpl4vqYphH7+P40nzBRcxJHrv5FeXlTrb+drjyXNjZSCmzfkOuCqPspBuJ7vab0/9oeNERg
nz6SLCjLKcDXbMbKcRXgNhFBlzN4OUBqieSBXk80w2Nzx12KvNj758WavxOsXIbX0Zxwo1h3uw75
AI2v8qwFWXNclO8qW2VXoq6kihWpeiuvDmFfSAwRLxwwIjgUuzG9SaQ+pOomuaC7QTKWMI0hL0b4
mEPq9GsPPQq1UmwkcYFJ/Z4I93DZuKcXmKMmuANTS6wxwIEw8Q5MQ6y9fbJxGEOgOgYL4QIqNULb
5CYPnt2LeiIiEnh8Uuh8tawqSjnR0h7Bv5q4mgo3L1Z9QQuexUntWD96t4o0q1jXWLyrpgP7Zcnu
CzCCBYMwggNroAMCAQICDkXmuwODM8OFZUjm/0VRMA0GCSqGSIb3DQEBDAUAMEwxIDAeBgNVBAsT
F0dsb2JhbFNpZ24gUm9vdCBDQSAtIFI2MRMwEQYDVQQKEwpHbG9iYWxTaWduMRMwEQYDVQQDEwpH
bG9iYWxTaWduMB4XDTE0MTIxMDAwMDAwMFoXDTM0MTIxMDAwMDAwMFowTDEgMB4GA1UECxMXR2xv
YmFsU2lnbiBSb290IENBIC0gUjYxEzARBgNVBAoTCkdsb2JhbFNpZ24xEzARBgNVBAMTCkdsb2Jh
bFNpZ24wggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQCVB+hzymb57BTKezz3DQjxtEUL
LIK0SMbrWzyug7hBkjMUpG9/6SrMxrCIa8W2idHGsv8UzlEUIexK3RtaxtaH7k06FQbtZGYLkoDK
RN5zlE7zp4l/T3hjCMgSUG1CZi9NuXkoTVIaihqAtxmBDn7EirxkTCEcQ2jXPTyKxbJm1ZCatzEG
xb7ibTIGph75ueuqo7i/voJjUNDwGInf5A959eqiHyrScC5757yTu21T4kh8jBAHOP9msndhfuDq
jDyqtKT285VKEgdt/Yyyic/QoGF3yFh0sNQjOvddOsqi250J3l1ELZDxgc1Xkvp+vFAEYzTfa5MY
vms2sjnkrCQ2t/DvthwTV5O23rL44oW3c6K4NapF8uCdNqFvVIrxclZuLojFUUJEFZTuo8U4lptO
TloLR/MGNkl3MLxxN+Wm7CEIdfzmYRY/d9XZkZeECmzUAk10wBTt/Tn7g/JeFKEEsAvp/u6P4W4L
sgizYWYJarEGOmWWWcDwNf3J2iiNGhGHcIEKqJp1HZ46hgUAntuA1iX53AWeJ1lMdjlb6vmlodiD
D9H/3zAR+YXPM0j1ym1kFCx6WE/TSwhJxZVkGmMOeT31s4zKWK2cQkV5bg6HGVxUsWW2v4yb3BPp
DW+4LtxnbsmLEbWEFIoAGXCDeZGXkdQaJ783HjIH2BRjPChMrwIDAQABo2MwYTAOBgNVHQ8BAf8E
BAMCAQYwDwYDVR0TAQH/BAUwAwEB/zAdBgNVHQ4EFgQUrmwFo5MT4qLn4tcc1sfwf8hnU6AwHwYD
VR0jBBgwFoAUrmwFo5MT4qLn4tcc1sfwf8hnU6AwDQYJKoZIhvcNAQEMBQADggIBAIMl7ejR/ZVS
zZ7ABKCRaeZc0ITe3K2iT+hHeNZlmKlbqDyHfAKK0W63FnPmX8BUmNV0vsHN4hGRrSMYPd3hckSW
tJVewHuOmXgWQxNWV7Oiszu1d9xAcqyj65s1PrEIIaHnxEM3eTK+teecLEy8QymZjjDTrCHg4x36
2AczdlQAIiq5TSAucGja5VP8g1zTnfL/RAxEZvLS471GABptArolXY2hMVHdVEYcTduZlu8aHARc
phXveOB5/l3bPqpMVf2aFalv4ab733Aw6cPuQkbtwpMFifp9Y3s/0HGBfADomK4OeDTDJfuvCp8g
a907E48SjOJBGkh6c6B3ace2XH+CyB7+WBsoK6hsrV5twAXSe7frgP4lN/4Cm2isQl3D7vXM3PBQ
ddI2aZzmewTfbgZptt4KCUhZh+t7FGB6ZKppQ++Rx0zsGN1s71MtjJnhXvJyPs9UyL1n7KQPTEX/
07kwIwdMjxC/hpbZmVq0mVccpMy7FYlTuiwFD+TEnhmxGDTVTJ267fcfrySVBHioA7vugeXaX3yL
SqGQdCWnsz5LyCxWvcfI7zjiXJLwefechLp0LWEBIH5+0fJPB1lfiy1DUutGDJTh9WZHeXfVVFsf
rSQ3y0VaTqBESMjYsJnFFYQJ9tZJScBluOYacW6gqPGC6EU+bNYC1wpngwVayaQQMIIGizCCBHOg
AwIBAgIMbfHmsZjcB+HruaVKMA0GCSqGSIb3DQEBCwUAMFIxCzAJBgNVBAYTAkJFMRkwFwYDVQQK
ExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBDQSAy
MDIzMB4XDTI1MDYyMDEzNDMzNFoXDTI3MDYyMTEzNDMzNFowgdQxCzAJBgNVBAYTAlVTMRMwEQYD
VQQIEwpDYWxpZm9ybmlhMREwDwYDVQQHEwhTYW4gSm9zZTEZMBcGA1UEYRMQTlRSVVMrREUtNjYx
MDExNzEOMAwGA1UEBBMFR3VwdGExDjAMBgNVBCoTBVZpa2FzMRYwFAYDVQQKEw1CUk9BRENPTSBJ
TkMuMSEwHwYDVQQDDBh2aWthcy5ndXB0YUBicm9hZGNvbS5jb20xJzAlBgkqhkiG9w0BCQEWGHZp
a2FzLmd1cHRhQGJyb2FkY29tLmNvbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBANg8
iuIMIJTRhFElF5kiGA/iibojGqPcfDgZCPyMvuucV7LpWj77dMx05lOtPOr5ol6QoQf3DzLny2Fm
ZKzsTDzWEhPsCM5DcbMg/B7eD9n+rBWHxsk+yKJKdkLpkpTKdxxTd1Y5Ln+k5KCTjxlCUQQ7Q2Zz
qYU8bfRq5ZMwUVJD3NZCqEKbEIgSX2vXFS61zdPwnLyHyaC/erAWmgHLu4kzpk/V10NcnUjX9FYK
f/Ggi9MeMNG20gEIUbCg3RgYf89YLXUJDOuoz/Yajw/VuiVlwS81wF44DmJhAVcGzrI00uydpksG
oQY2qVlhYsvNTqU2V/uaBrKQnyM0PkU140cCAwEAAaOCAdwwggHYMA4GA1UdDwEB/wQEAwIFoDAM
BgNVHRMBAf8EAjAAMIGTBggrBgEFBQcBAQSBhjCBgzBGBggrBgEFBQcwAoY6aHR0cDovL3NlY3Vy
ZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyNnNtaW1lY2EyMDIzLmNydDA5BggrBgEFBQcw
AYYtaHR0cDovL29jc3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyNnNtaW1lY2EyMDIzMGUGA1UdIARe
MFwwCQYHZ4EMAQUDAzALBgkrBgEEAaAyASgwQgYKKwYBBAGgMgoDAjA0MDIGCCsGAQUFBwIBFiZo
dHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzBBBgNVHR8EOjA4MDagNKAyhjBo
dHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWltZWNhMjAyMy5jcmwwIwYDVR0RBBww
GoEYdmlrYXMuZ3VwdGFAYnJvYWRjb20uY29tMBMGA1UdJQQMMAoGCCsGAQUFBwMEMB8GA1UdIwQY
MBaAFAApNp5ceroPry1QLdugI4UYsKCSMB0GA1UdDgQWBBQI6pBWVwIN47wGrC1m7lYfqN94QjAN
BgkqhkiG9w0BAQsFAAOCAgEAOdSnSEyuTvTtsnmEilB0JfgRKx1MM7kNdv0pfWcINJhssfHD8Fc5
wm+JzenYR9yJAkntX0Lr9yv+OG0Jqhvy7u9gKljfI4jXO4qxZ2jf1YvI+fDK29/NV3JAQuipT3Vs
IxBI73CQO11VwMePOTsUNM1s+9cWT5zLuqOEEu+95jRo5KEtH1/4nahrToLU1Y+flylsBaAUhB72
KoBBzdewa+psa32lY8X23AWDoczIlUBmPt0hmApBvHOUCYszSiBu4/VhVDuq2iMBtnYAj2j9Q7Ct
pZHPj6fQv247S9dTDDym05r8arHAsUw7B29KvPfxeaqexL4gwQQjIsfdZeh88XYLXA+mvEej6OlO
YO3546G7bczFxIjO6V9RrvYEeAb+n7udXYymuIm02XtxIkr/Uk0gRuFoOpG2Dw1OH8xsOUER1+16
qGb2QKMgaKL/IIM3gXAuCxNVBOT+Fj/wh5hw7MFvTTXPFA8IKusoHZYpxdrr9xjoJ/wt6j4/E6K4
IO/WuSc4nM6kshiwIu5c6r97213ZtJFOrjoITiBIYFP0WQsTsEbWvaBX/7daT5IVr9rvCOCk2JA8
bOWwP4OYXCKJY5nZOntb0ECSI7RM0kGelGY4MAD42+OBWHxKU1Qvt5WK4kIXdKpdFp9Drv17PyCU
dR4AvAJyWnkqZyi5QuRg/hMxggJXMIICUwIBATBiMFIxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBH
bG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBDQSAyMDIz
Agxt8eaxmNwH4eu5pUowDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEIHbKzcen9JNu
FUeHvOvZ7kNfAGFxlUbFKQh1qWEXt0CPMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZI
hvcNAQkFMQ8XDTI2MTEyMDA1MTU0M1owXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQMEASowCwYJ
YIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJYIZIAWUD
BAIBMA0GCSqGSIb3DQEBAQUABIIBAA4t63jfkBRG6A24IbgLgZs5w40+wgy2vJHBvWeghyeI8tTX
BcAt2lZMBlLFgz8+9AtW1/YqCQ+K6wZY63xav4qfAzIod4nfgK8R+VgIj7HFZahtWNR6Ev9v6yL3
76sOpa7yCtfOdV6ZSOG6Czbp/HVz/VCIYIzEJwoa1sVA+JN0xFk3Ij57UoSD3jeYcAhXFxUQT5lI
+Fp8MhvaAlH7oym6aUG7ZwrV4Re9PliavvwoLAb/3mcrNBng8WnNsRKluuqpfFxy6J2gO8tVsyEB
RSG32S4Ebvi/qYQL7hlKy1cz6dBKN39Qfl7A6RFuFZ+imzL7BxEmZK1I1tOgtvke0A4=
--00000000000003c2000660ae56ad--

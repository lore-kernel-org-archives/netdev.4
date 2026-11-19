Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795097305;
	b=w4lapFefrFwnlaqab/u1bnZiMmQrLIuIFYQ5QZ8j0tjk5FGrpSPLHO/dnTXaMS7fub0x
	 J42cVNWpBydsCvmWUX169ZlofauqrJ/paU+FJLFHiNy4OR9NIs2voHvdYzaxFo2xQS28R
	 MgtIgHP2FJECvPhgx7AtRuViUUdb6D+J3ZeXcTsaF6/5HQRxMiOCHL6hIGysx40mHNL77
	 kFVA7+BnNI8PUN41Q8RhHlDOYdCkypzpDxVXv5l0lfA6pTPo5x6TO31tt9PJ7KH5AKvsz
	 59DI8/wf4HFERhL0FnL2TGIiaiFpLCMpbkyZpao+PJ6QREXOrdJZTXXqtXkPiCna3PQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795097305;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:In-Reply-To:References:Date:
	 Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=SIHSV1IpBaMKVDnGLqd2BIgwlBfdsmCMHYeLhNPH/3A=;
	b=iXy1DjnAGFyjNA+a4QcoovUBtwP0R5ZYqAydvIblBag6umDirSvyeRTiYHrG/glnRJIq
	 ZMB61WI8QbEH1ztTWrcJFRXqfvbr2nvmb8KIWrk1/M/kpRPk0ZeP0x0MD1zhh9sRDLeP4
	 VNjwGyqfskP454UlEYiKCHMb+pXbkSgffNJma1MzuqV0zUtW9XK/gXTIcK4D5YyOdv+lu
	 f/ibcwAfTmjbSuAtUgVMefp+fEKxr3l3acp4+otBsEGB/XnLvjob5F1v0JB2fhrdJZ5WF
	 KCJ4fPO/NLRiGkS9Og1NAYf4vl0Hm64CFxHIHKlxAVnploLMZfYw8zZt8kRlA6s99QQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iP84R5qr;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=FVrmCZ+R;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53472606A330
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 14:08:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53472606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iP84R5qr;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=FVrmCZ+R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795097304;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SIHSV1IpBaMKVDnGLqd2BIgwlBfdsmCMHYeLhNPH/3A=;
	b=iP84R5qrwGs00hOISlIN1aClQCt4bOGn+n6X4snfSfYkdFvAN+L4dhrpVk4q6B99RW8nz3
	m2KhVoAMyyoqQi1PytV+CrLW3d3qRfTMyxOzxc/D/3OvQsATTUzDbOek9ByOCf+0tt/mQC
	h2lWZk4EoBAbDiayuL5C274qro2fbp8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-344-qvv45lszOba59NostUCA6A-1; Thu, 19 Nov 2026 09:08:22 -0500
X-MC-Unique: qvv45lszOba59NostUCA6A-1
X-Mimecast-MFC-AGG-ID: qvv45lszOba59NostUCA6A_1795097301
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-4a3052225cbso2113794f8f.1
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 06:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795097301; x=1795702101; darn=vger.kernel.org;
        h=content-type:mime-version:user-agent:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SIHSV1IpBaMKVDnGLqd2BIgwlBfdsmCMHYeLhNPH/3A=;
        b=FVrmCZ+R8Xyvcb6Fo+2dfgCa/cUkJC5dGQKzNLYnVgGMQE87/INMBDqGq+18jMZbH3
         XGYBdgc9+reQF9p5GMWM4leZXqVA3wzKJt3TLUYieAwgWmGhAjLDuxXuDSub02mDJQaX
         qZso4obGSOr1SfaAd2lgXCkllGFyVlY/y2bYaxb/968OK3AqsbqDY/xtrctb5ZclCKLx
         p913xoapLmjk2161ii5pS7EhVtWFUvwvoldUR5hmcRPufYl7rDeV0XUEdavPBBnSw0Hg
         4KoeRPcIHW1A7f4FxdR9htPtXC9AfcU6RiNaz2emqzaUwfT4DbVvNJag4+1nac+MPU3m
         kFhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795097301; x=1795702101;
        h=content-type:mime-version:user-agent:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=SIHSV1IpBaMKVDnGLqd2BIgwlBfdsmCMHYeLhNPH/3A=;
        b=PfQKVuvwx4Boe2x+YO670GK+rM9qPz6kTb3u9gNlLqz/+Z4Wnen8kozbDbWlgZG55e
         QNidyiz+hKyvYcb1ZiMyELNHqKZB77VBuF/kXyBDWKQbQsx41xEu7lGowR2yAU3gr/HB
         wg247aG8+cqUeqkAj5/yDbY7SWeg9CyCK1diyXvybQT2mvj9PC40b4aebaXl1RdjvZHi
         uA9xVG+ehWR5qQgH5+/Zx11TiJpChWKIeV1/NNXS0SnEAwWlpbYBOulCN3/JyaxOf3JC
         xi3NJVPGXV77lH0G4Sv0DlWc6Ww1OuhGa9lkxxlzEy0q52nYEVZVGY9Jxzo//7OaRk2q
         12kA==
X-Forwarded-Encrypted: i=1; AL+hErGiArAzPVBREFPMNgPJ+Drm4ocBssDqZ8EEClmWSFkJVX5Mdz4DnAiqGi3BBX7xn4osuxi+TK0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/OER4OMWbXcQ12Sn+08LImy2OPedCvRv1euwLto9257doOCX7x
	9v9caOX5KOqS7pA6fAHlzoe1jsnZtPja9DscqVruJ8EXU5tdgW8uBlkPJwDu8XMazwadpAqSWXM
	8L6jUhteYakvZXSsvW7WE85znZRR6yhbOu4Xik7u22E6vIbCioxUHHiX6gxG0MzYT5A==
X-Gm-Gg: AZFdTZcGIyzpMxttwY7t0dM5dkywE9cLO/plvtdXS67l3z5YmZIFrABFVDVplBYcyod
	JpGDaDWIm5fmyocevdBn76lGSF9mz/7c+t7cj6DKat2c1k4f4XZ8f8UQZfMIAWH+Gmpyo2E4e+7
	Z+iHUus6NkMpysZrk4nb1upadVPORP7VVC+Q0fZnEbho3huGkm+Idf4jt4vTfc+ZoI9GiIjGx7R
	keF3ZiZ+vnuqI7/A1aU6OOoJ/DK7zbqnQ9dm8nNouLaAi+/INlWtavU+GEYf1ikijcFTBYOPobv
	z8ufEExffW1rKkZxkSbKSOoKMpWX8mpzIuTFJ15IQ+zKUS5Z7LilL0EvWB8tK6DA0TD6SmLEEMd
	Gft0WAva42Qnfps46tCA42+iK1SObrxHmUGtsNmCkjDRUl6OiZ7suhcdrZ7VgWCXsw5ZXo4V3IO
	/H2tg=
X-Received: by 2002:a5d:5f45:0:b0:4a7:a8f:527a with SMTP id ffacd0b85a97d-4a70a8f55cfmr11702280f8f.7.1795097301478;
        Thu, 19 Nov 2026 06:08:21 -0800 (PST)
X-Received: by 2002:a5d:5f45:0:b0:4a7:a8f:527a with SMTP id ffacd0b85a97d-4a70a8f55cfmr11702222f8f.7.1795097301033;
        Thu, 19 Nov 2026 06:08:21 -0800 (PST)
Received: from aconole-thinkpadt14gen4.rmtusnh.csb ([144.121.52.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab5490e32asm31634f8f.22.2026.11.19.06.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 06:08:20 -0800 (PST)
From: Aaron Conole <aconole@redhat.com>
To: Kyuwon Cho <kyuwoncho18@gmail.com>
Cc: Eelco Chaudron <echaudro@redhat.com>,  Ilya Maximets
 <i.maximets@ovn.org>,  "David S. Miller" <davem@davemloft.net>,  Eric
 Dumazet <edumazet@kernel.org>,  Jakub Kicinski <kuba@kernel.org>,  Paolo
 Abeni <pabeni@redhat.com>,  Simon Horman <horms@kernel.org>,
  netdev@vger.kernel.org,  dev@openvswitch.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: openvswitch: don't WARN on a non-IP packet
 that needs fragmenting
In-Reply-To: <179502509517.2983267.1652158471891914135@gmail.com> (Kyuwon
	Cho's message of "Wed, 18 Nov 2026 10:06:09 -0800 (PST)")
References: <179492834266.3639154.14679778183890331729@gmail.com>
	<f7to6bmjayg.fsf@aconole-thinkpadt14gen4.rmtusnh.csb>
	<179502509517.2983267.1652158471891914135@gmail.com>
Date: Thu, 19 Nov 2026 09:08:17 -0500
Message-ID: <f7twlq8hq26.fsf@aconole-thinkpadt14gen4.rmtusnh.csb>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Kyuwon Cho <kyuwoncho18@gmail.com> writes:

> ovs_fragment() only handles IPv4 and IPv6 and drops any other packet
> with a WARN_ONCE(). Since OVS_PACKET_CMD_EXECUTE takes the MRU from
> userspace, any ethertype can get there, e.g. an MPLS packet executed by
> an unprivileged user in its own user and network namespace:
>
>   Failed fragment ->ovs0: eth=8847, MRU=500, MTU=1500.
>   WARNING: net/openvswitch/actions.c:831 at ovs_fragment+0x239/0x840, CPU#1: test/106
>   Call Trace:
>    do_execute_actions+0x580e/0x7380
>    ovs_execute_actions+0xd3/0x3e0
>    ovs_packet_cmd_execute+0xc21/0x13c0
>
> The packet is dropped either way, so use a rate-limited warning instead.
>
> Fixes: 7f8a436eaa2c ("openvswitch: Add conntrack action")
> Closes: https://lore.kernel.org/netdev/179492834266.3639154.14679778183890331729@gmail.com/
> Signed-off-by: Kyuwon Cho <kyuwoncho18@gmail.com>
> ---
> Aaron, here is the patch, with the rate-limited warning you suggested.
> It was written with LLM assistance; we reviewed and tested it. With it
> applied on net, the reproducer from the report prints the message
> instead of warning.

Thanks - it makes sense to me.  We could consider pr_warn_once instead
if preserving the 'only log once' semantic is important.  I guess the
intent here was to let developers know that there was a really
misbehaving ovs-vswitchd process going on.  Given it can be triggered by
an arbitrary user on many distributions, it would hide that - so I think
net_warn_ratelimited makes sense to call instead.

As a follow on, it's worth consideration to change the mru check to only
submit packets that can be handled.  That's a bigger lift since we might
want to change that action to preserve the drop reason
(OVS_DROP_FRAG_INVALID_PROTO) when we get the 'asked to fragment a
packet that does not make sense'.  Alternatively, we could drop it
entirely and just take the PKT_TOO_BIG drop path.  After all, we know we
can't fragment it, and that the link won't forward it.  For now,

Reviewed-by: Aaron Conole <aconole@redhat.com>

>  net/openvswitch/actions.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/net/openvswitch/actions.c b/net/openvswitch/actions.c
> index 12e339cbf791..bf3f2b328b53 100644
> --- a/net/openvswitch/actions.c
> +++ b/net/openvswitch/actions.c
> @@ -828,9 +828,9 @@ static void ovs_fragment(struct net *net, struct vport *vport,
>  		ip6_fragment(net, skb->sk, skb, ovs_vport_output);
>  		refdst_drop(orig_dst);
>  	} else {
> -		WARN_ONCE(1, "Failed fragment ->%s: eth=%04x, MRU=%d, MTU=%d.",
> -			  ovs_vport_name(vport), ntohs(key->eth.type), mru,
> -			  vport->dev->mtu);
> +		net_warn_ratelimited("Failed fragment ->%s: eth=%04x, MRU=%d, MTU=%d.\n",
> +				     ovs_vport_name(vport), ntohs(key->eth.type),
> +				     mru, vport->dev->mtu);
>  		reason = OVS_DROP_FRAG_INVALID_PROTO;
>  		goto err;
>  	}


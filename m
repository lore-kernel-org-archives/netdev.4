Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795077584;
	b=3f2PzNerwSTC08nNgVIafWiUBVikCyHjKh/mQxaZL3+rgv9MpZ/Vm4l38Vk8wjf1Regz
	 jGrfGDtHnmHyFI5sK5dmdaf7kqZK8wHaQ4CZtOFzgxADrHxi/nyo67f7vaYHmv+Mfg5GY
	 2SHLMRX4Ztsl4ZApMk7gCf4h5Du7DX7zqdkpvKJ+t1zHqmc+JUM9le9gOY/GO0d98ZeiZ
	 QgpeLqFKzQK8/yqVYXTwWos8zsaI5DgCTRnbXDIcD5IZTrVE1ayW0zjkEKJ1N1YNGBJck
	 QIVFgEoEvs1OlNaBrg+lH3tBYVQ8z5N0J4Wg2r6nXfYZNxiIGAVMRt1bw+14ANdEz7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795077584;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=vPWhm6JE0CImHXK++LMvsnA21/q4aoOMd/fYOnjLm9o=;
	b=s5cZZsgkBIlsf/wEIlPGRgc+BzUJPPKF0ku5kiJm7Ba0ftr+2LynZnk0d/b3RiLpgYfL
	 4QmAhVDxuhAmggkPk0JkahNVz7xj69IjY2KUiwxVR8GNA6tvUHnuEqTcFFCVY2qJBGwMF
	 QFenZO+fNbtgWRMX1i8Fi/OgjXJ4YFtNEG8v4ApSCv3dAs7PqsoK5mW4KcsVD7D8MCwU7
	 s0KVyCB6j+EyzfAi1CN/JPewmGAu0EqEbpp93iZ1nB9Qntbbm9alWUNA8Z7PdJo0pxaPi
	 Ts3AXsJwcqo2Vw8pmntXiFnvFh4hYcTEbuBgmBvk5/qH7G2nq/2anTfaDuNWa09fCWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="BX3JB/d2";
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D261606A333
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 08:39:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D261606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BX3JB/d2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795077583;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vPWhm6JE0CImHXK++LMvsnA21/q4aoOMd/fYOnjLm9o=;
	b=BX3JB/d2QlUvBdN88SPeDaMZ6EZQdNKHCRl5BHlBVeTo2oFo3RDYjadkwM5Co92KzVauB0
	OpGiqsnSKdnKHbdPgBWAPZOGOE7L+pUlG2XMONGFzJOeoBU5MFeHh/meyAOVeu+r38cVJx
	WwxdODIvDzGIANRm1SXRoOIgRyu/uz8=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-491-SjxZP_iUM9aTLwh6tlkkhA-1; Thu,
 19 Nov 2026 03:39:40 -0500
X-MC-Unique: SjxZP_iUM9aTLwh6tlkkhA-1
X-Mimecast-MFC-AGG-ID: SjxZP_iUM9aTLwh6tlkkhA_1795077578
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6D6B4180059B;
	Thu, 19 Nov 2026 08:39:38 +0000 (UTC)
Received: from pabeni-thinkpadp1gen8.rmtit.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E41DE41F;
	Thu, 19 Nov 2026 08:39:35 +0000 (UTC)
From: Paolo Abeni <pabeni@redhat.com>
To: zihanx@nebusec.ai
Cc: netdev@vger.kernel.org,
	dsahern@kernel.org,
	idosch@nvidia.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	vega@nebusec.ai
Subject: Re: [PATCH net 1/1] ipv6: mcast: use resolved interface for source filters
Date: Thu, 19 Nov 2026 09:39:20 +0100
Message-ID: <20261119083920.30482-1-pabeni@redhat.com>
In-Reply-To: <a5d3d0505baed01a213ea7953f0fe78cb025ee22.1794492711.git.zihanx@nebusec.ai>
References: <a5d3d0505baed01a213ea7953f0fe78cb025ee22.1794492711.git.zihanx@nebusec.ai>
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

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
Full review at: https://netdev-ai.bots.linux.dev/sashiko/
---
--- Patch [1]: [PATCH net 1/1] ipv6: mcast: use resolved interface for source filters ---
commit 65be18fe1d53e3d386a91fc23d1c7ba9cc2e7b28
Author: Zihan Xi <zihanx@nebusec.ai>

ipv6: mcast: use resolved interface for source filters

This patch makes ip6_mc_source() match socket memberships against the
ifindex of the device resolved by ip6_mc_find_idev(). Before, it treated
gsr_interface == 0 as a wildcard. The resolved ifindex is also passed to
ipv6_sock_mc_drop() when the last source is removed.

> diff --git a/net/ipv6/mcast.c b/net/ipv6/mcast.c
> index ecef55f261890..63770b3a7bb25 100644
> --- a/net/ipv6/mcast.c
> +++ b/net/ipv6/mcast.c

[ ... ]

> @@ -375,6 +376,7 @@ int ip6_mc_source(int add, int omode, struct sock *sk,
>  	idev = ip6_mc_find_idev(net, group, pgsr->gsr_interface);
>  	if (!idev)
>  		return -ENODEV;
> +	ifindex = idev->dev->ifindex;
>  
>  	mutex_lock(&idev->mc_lock);
>  
> @@ -386,7 +388,7 @@ int ip6_mc_source(int add, int omode, struct sock *sk,
>  	err = -EADDRNOTAVAIL;
>  
>  	for_each_pmc_socklock(inet6, sk, pmc) {
> -		if (pgsr->gsr_interface && pmc->ifindex != pgsr->gsr_interface)
> +		if (pmc->ifindex != ifindex)
>  			continue;
>  		if (ipv6_addr_equal(&pmc->addr, group))
>  			break;

[Severity: Medium]
[Finding: main-1-0]
[Sources: opus-5-5]
Does this break MCAST_JOIN_SOURCE_GROUP with gsr_interface == 0 when the
socket already has a membership for the group on another interface?

__ipv6_sock_mc_join() still treats ifindex 0 as "any interface". Its
duplicate check also runs before ip6_mc_find_dev() resolves the device:

net/ipv6/mcast.c:__ipv6_sock_mc_join() {
    ...
	for_each_pmc_socklock(np, sk, mc_lst) {
		if ((ifindex == 0 || mc_lst->ifindex == ifindex) &&
		    ipv6_addr_equal(&mc_lst->addr, addr))
			return -EADDRINUSE;
	}
    ...
	dev = ip6_mc_find_dev(net, addr, ifindex);
    ...
}

The caller accepts -EADDRINUSE and goes on to call ip6_mc_source():

net/ipv6/ipv6_sockglue.c:do_ipv6_mcast_group_source() {
    ...
		retv = ipv6_sock_mc_join_ssm(sk, greqs.gsr_interface,
					     &psin6->sin6_addr,
					     MCAST_INCLUDE);
		/* prior join w/ different source is ok */
		if (retv && retv != -EADDRINUSE)
			return retv;
    ...
}

Suppose the socket joined group G on interface Y, and the route for G
resolves to interface X:

do_ipv6_mcast_group_source()
  ipv6_sock_mc_join_ssm(sk, 0, G, MCAST_INCLUDE)
    __ipv6_sock_mc_join()
      returns -EADDRINUSE (matches Y, nothing created on X)
  ip6_mc_source()
    ip6_mc_find_idev() resolves to X
    no pmc with ifindex == X
    returns -EINVAL ("must have a prior join")

Before this patch the call returned 0, but it changed the socket filter
on Y while updating the interface filter on X. After this patch it fails.
In this state, a source-specific join with interface 0 can never join on
the resolved interface.

IPv4 does not have this gap. __ip_mc_join_group() calls ip_mc_find_dev()
first, which writes the resolved ifindex into imr. The duplicate check
then uses that ifindex.

MCAST_BLOCK_SOURCE, MCAST_UNBLOCK_SOURCE and MCAST_LEAVE_SOURCE_GROUP
with interface 0 also behave differently when the only membership is on
an interface the route does not resolve to, for example after a route
change.

One case that used to work now fails with -EINVAL: removing the last
INCLUDE source with MCAST_LEAVE_SOURCE_GROUP. Before this patch, that
path reached ipv6_sock_mc_drop(), which cleaned up using the pmc's own
ifindex.

Should __ipv6_sock_mc_join() resolve the device before its -EADDRINUSE
check, as IPv4 does? This is tagged for stable, so could the commit
message also say that these setsockopt() calls can now return -EINVAL?
-- 
This is an AI-generated review.


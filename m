Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795345087;
	b=Cf2TRIe+j63tkr0XG7LemIoH8YwUCxJwpokuI//osFv1EXPtPXTWSJzcHxLc2dZa6Wul
	 rz7nFp7a8mHtM4dCCTGokne1fU8n5FbFDFHZ6Ji4AZ/sXAR9nFn+Fz3yrQF82WRWa75OG
	 1IglqKpIbjDW6YdYUtjfC90Zlz8DW+oqaqJRTeuw5YPdAHfGOuUUGFF5TNnbB57mayp0A
	 yJLlHUKbUC5kw2urF2NN6zGZiHeW4FoIhcCdfvFCnWhqa6BjVJzuDNvtBLXi7zu5ZwYuQ
	 I2GnuccoxVjJhptvMAIXW/LSqTWSXH9UEK28cA4UzTHtb7AXp2yib/VZKVBJZMBE4Ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795345087;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:Content-Language:To:Cc:References:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=1BgKHSd3CQAdu9W4c7Bsjn/CT1XjSRVEIx6RizkYoTw=;
	b=LRItAGzn9uih932R5shOLuMFgHGl+yAPQF7LxeHgvLm1Jy1vtyhRv2K+uy5akREdmV7P
	 hWaxzWJCbngm12i1DbiJUCM5PccSFxtWo8Rq9QXXpmoukgyhq9KVypMIIRBbwL4Mfk6FU
	 VmKCZkbvAscY+ukThGDr6S5nkGXEkup1O5doV/aL5YoEmzMTBs0N0ydzFG5Hdyu2sXXDc
	 lT1NnCjGnxERGgS4O+F0WMVoTaF9jqnb6jO8SoSyhhWOYjjbGetgF8zwFFXyc/pW0fDi/
	 VxWj9TIZ5IFqbHIUnKgXTTYl3R1Ne0z7uxSWMAbDpV4EAi19HgFkZqH1EeE2hQw1RSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=blackwall.org;
	spf=none smtp.mailfrom=blackwall.org;
	dkim=pass header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=N5azeeLS;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B63606A334
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 10:58:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80B63606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=N5azeeLS
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so19567055e9.0
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 02:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1795345086; x=1795949886; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1BgKHSd3CQAdu9W4c7Bsjn/CT1XjSRVEIx6RizkYoTw=;
        b=N5azeeLSlU0U2ox+pLF5X6rx1KmomVgd1hnhIZmqXT9K1GhQdfeOO0b4hVl63f8inl
         RFcPBhyUiLA3N1OXnw/zQiQHR1sxXg0nAtlWjMEJflnrOGryK1Svnp26Uhd0qkVpInuF
         SFWQmgAmIjrJ1aW9nlDUuE1oLmkJDlfICZpFuL3F5+tKiZ2TTR7VGvGng/UgVmXoGBE9
         j0mtWX0nV+viotZdeaREjrXGkdwqC0GUbhSaG8miogntGKNpj8eQKyLtkU5Rrp2wb0wc
         rw+jpIRZLUT5nDVQKLAODsBc9SOZbVTaZnpsMWuXQII5kU9PAAl42fel0RB6pwaJQPih
         hEFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795345086; x=1795949886;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1BgKHSd3CQAdu9W4c7Bsjn/CT1XjSRVEIx6RizkYoTw=;
        b=CwFOaoEa5F5Nfvq5WP05Ac3PxVbavhiUI9ltmDQk6oEjElsZ6eQiqIXaS6ea4dKXns
         wtmhjkOxq5ZFBIZ1OiknGiCHEJHxyY1E7RyE9jyZoh8gGm2wEXY3sL6kwZOpP6LnBO7R
         kNkRQvcSUpaCxsq7mXYKr//zLrJzm+P3q/Cs8B9Pun4u1DPIYWgYSnwry7OXyimRZzIC
         JG1wrg/StVh2sziFLb/HyIexMipc0PxNnZMhozsu1zrzVPS+poVi4tOi1d1RuZ/TUdDz
         bg8NLHmQd2VT2omOg9JazbuCJvnFezEnbkBsItpD4yOkVjsRWIsvxCD1G0dZSSFQ0JrE
         2ktA==
X-Gm-Message-State: APuU4Z/Q5qToDTHEMymfCUnnMB45HUyoYjiM3NwAxuc+eBm9I9DIZQeI
	V+k3VXlneYzCRe+0rNWtmpmgqjFjj+dT8/URVq+192OsuGt4bhYzkIasGsUwu0CIq/8=
X-Gm-Gg: AZFdTZeZoSeJa0Ge8g6XVMywZSxOQbYOeZkITHEDYNT8+Fz9k0BdjBna6Pp9HS08/pE
	fqAJ+ZJJEjJo99dD97b/+g1ifyNt78AONuBM+WXppmTb39lVyT+A/rI42iUJ8qRnAUiFgWw58rB
	gxwCpgccUfqKTAJ6pO0J6qP57W3X+A4LCKnVQszg4vyO4joogiyJRXeJgyXQg0WKe1AQ2WxfaJP
	0awjw/L2dLIPlSUrojOyjBVrfo1mahd8yzGuq9pOLt5fE4MFF7cT7Pax+Ii0FJFOP7LwrpdvOj/
	N5eopSuzi/b3VxvCXiZrjERWIaBxQZsCuEroc06M6pN5otTRMRpucwkhYIxPxVAhjEOlndq0vbV
	NOADKlTxqO4OHcncWLnUFZkxdqJkwIlsz5clPH55Gehd8oaL9Pb6WqI4UyAnX6bg6WAI+syIbtF
	WfFrjwxDjI4GKGjN28d3UMmlc4MT2KrzvV/j2mM+YLTdfHqPV0KNjMaVoUDoa6nFCs4ZK68oaOd
	t1DeZG9BsLmE/1fG6FQpoQSAq1jGoFVCzUKqUypFRLssLUUv7mWIF6Jyt2irEjGLGzIP3SEU6CB
	InjuVuMnDKsiZQm6hNKkMtTCsqp4wh6PxfNMBW3zGtGxffFiv1IGrIaXSGsb
X-Received: by 2002:a05:600c:820d:b0:4a1:dfaf:f465 with SMTP id 5b1f17b1804b1-4bb887c2ca3mr186411065e9.4.1795345085983;
        Sun, 22 Nov 2026 02:58:05 -0800 (PST)
Received: from [192.168.0.161] (78-154-14-127.ip.btc-net.bg. [78.154.14.127])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906e4ce6sm105568865e9.4.2026.11.22.02.58.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 02:58:05 -0800 (PST)
Message-ID: <4937f07a-6238-4136-94ca-a98b2f4b8db5@blackwall.org>
Date: Sun, 22 Nov 2026 12:58:04 +0200
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
Subject: Re: [PATCH net] net: bridge: withdraw the switchdev entry of an fdb
 entry made dynamic
Content-Language: en-US, bg
To: Julius Bairaktaris <julius@bairaktaris.de>,
 Ido Schimmel <idosch@nvidia.com>
Cc: netdev@vger.kernel.org, bridge@lists.linux.dev,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Willem de Bruijn <willemb@google.com>,
 Simon Horman <horms@kernel.org>, Vladimir Oltean <olteanv@gmail.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Jesse Brandeburg <jbrandeb@kernel.org>
References: <20261121191638.1724620-1-julius@bairaktaris.de>
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20261121191638.1724620-1-julius@bairaktaris.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/11/2026 21:16, Julius Bairaktaris wrote:
> Since commit 927cdea5d209 ("net: bridge: switchdev: don't notify FDB
> entries with "master dynamic""), br_switchdev_fdb_notify() reports
> neither the addition nor the deletion of an entry that the user added
> without NUD_PERMANENT or NUD_NOARP. The user can turn an entry that
> switchdev was told about, a learned one or a static one, into such an
> entry: fdb_add_entry() does it for "bridge fdb replace ... master
> dynamic", and __fdb_update() for "bridge fdb replace ... master use"
> (NTF_USE), which marks a learned entry as added by the user. The
> drivers then keep the entry they were given, and since its later
> deletion is not reported either, they keep it after the bridge has
> dropped it.
> 
> Report the deletion of the old entry to switchdev before either path
> makes it one that is no longer reported, as br_fdb_update() does before
> an entry moves to another port; br_switchdev_fdb_notify() tests the old
> flags, so only an entry that was reported is withdrawn. Entries with
> the extern_learn flag stay reported and are left alone. The NTF_USE
> branch is only reached from netlink: the packet path passes no
> BR_FDB_ADDED_BY_USER to br_fdb_update(). The offloaded flag of the
> entry stays as the drivers report it.
> 
> Found while reviewing how DSA tracks host addresses for bridge FDB
> entries. In QEMU with KASAN and dsa_loop given FDB operations and
> assisted learning, an address learned on a veth port of the bridge is a
> host address on the CPU port. After "bridge fdb replace <addr> dev vA
> master dynamic", or "... master use", and the deletion of the entry,
> net keeps the address on the CPU port in 3 of 3 boots for each command;
> with this change it is deleted at the replace in 3 of 3 boots for each.
> 
> Fixes: 927cdea5d209 ("net: bridge: switchdev: don't notify FDB entries with "master dynamic"")
> Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
> ---
> I used Claude (Anthropic) to help write these patches.
> 
>   net/bridge/br_fdb.c | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
> 

I think this has never worked, so this patch can go to net-next.
A few nits below.

> diff --git a/net/bridge/br_fdb.c b/net/bridge/br_fdb.c
> index b601245ad923..377ca8341029 100644
> --- a/net/bridge/br_fdb.c
> +++ b/net/bridge/br_fdb.c
> @@ -996,6 +996,16 @@ static bool __fdb_mark_active(struct net_bridge_fdb_entry *fdb)
>   		  test_and_clear_bit(BR_FDB_NOTIFY_INACTIVE, &fdb->flags));
>   }
>   
> +/* Called before @fdb becomes an entry that the user added as dynamic, which
> + * br_switchdev_fdb_notify() does not report: report the deletion of the entry
> + * switchdev was told about, if it was
> + */
> +static void fdb_switchdev_hide(struct net_bridge *br,
> +			       const struct net_bridge_fdb_entry *fdb)
> +{
> +	br_switchdev_fdb_notify(br, fdb, RTM_DELNEIGH);
> +}

This helper isn't helpful. Just call br_switchdev_fdb_notify directly.

> +
>   static void __fdb_update(struct net_bridge *br,
>   			 struct net_bridge_fdb_entry *fdb,
>   			 struct net_bridge_port *source,
> @@ -1005,6 +1015,7 @@ static void __fdb_update(struct net_bridge *br,
>   	struct net_bridge_port *old_port;
>   	struct net_bridge_dst old_dst;
>   	bool fdb_modified = false;
> +	bool roamed = false;
>   	unsigned long now;
>   
>   	/* attempt to update an entry for a local interface */
> @@ -1032,6 +1043,7 @@ static void __fdb_update(struct net_bridge *br,
>   			br_switchdev_fdb_notify(br, fdb, RTM_DELNEIGH);
>   			br_fdb_dst_write(fdb, dst);
>   			fdb_modified = true;
> +			roamed = true;
>   			/* take over HW learned entry */
>   			if (unlikely(test_bit(BR_FDB_ADDED_BY_EXT_LEARN,
>   					      &fdb->flags)))
> @@ -1048,7 +1060,12 @@ static void __fdb_update(struct net_bridge *br,
>   		}
>   	}
>   
> +	/* Only from netlink (NTF_USE), with the user's flag in @flags */

This comment is useless.

>   	if (unlikely(test_bit(BR_FDB_ADDED_BY_USER, &flags))) {
> +		/* After a roam the deletion was reported above */
> +		if (!roamed && !test_bit(BR_FDB_STATIC, &fdb->flags) &&
> +		    !test_bit(BR_FDB_ADDED_BY_EXT_LEARN, &fdb->flags))
> +			fdb_switchdev_hide(br, fdb);
>   		set_bit(BR_FDB_ADDED_BY_USER, &fdb->flags);
>   		if (test_and_clear_bit(BR_FDB_DYNAMIC_LEARNED, &fdb->flags))
>   			atomic_dec(&br->fdb_n_learned);
> @@ -1262,6 +1279,10 @@ static int fdb_add_entry(struct net_bridge *br, struct net_bridge_dst dst,
>   		if (flags & NLM_F_EXCL)
>   			return -EEXIST;
>   
> +		if (!(state & (NUD_PERMANENT | NUD_NOARP)) &&
> +		    !test_bit(BR_FDB_ADDED_BY_EXT_LEARN, &fdb->flags))
> +			fdb_switchdev_hide(br, fdb);
> +

I played around with the possible bits that can result from this change and I think
I got 1 bad case:
What if a user adds a master static entry (created with BR_FDB_ADDED_BY_USER but without
ext_learn) which is later programmed and gets BR_FDB_OFFLOADED set, then a replace with
"master dynamic"?
That is,
bridge fdb add master static, bridge -> swdev driver issues add (entry is now ADDED_BY_USER | STATIC),
swdev -> bridge (entry is now with | OFFLOADED), bridge fdb replace master dynamic (ADDED_BY_USER | OFFLOADED)
but the entry has been deleted in dsa / mlxsw due to the new swdev del that is sent

>   		old_dst = br_fdb_dst_read(fdb);
>   		modified = fdb_update_dst(fdb, old_dst, dst);
>   
> 
> base-commit: d5b89d55a322b632e2b465b392a4c1d9d338db9c


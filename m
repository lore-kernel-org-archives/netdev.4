Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794753631;
	b=A5JQkAjn1ErWOBSP5rTB5y1CZaPIs3HZZhEalwNmyt862ZLI7OHYmx+LJ/6W2SnujVE3
	 gtZ4jH+tbLB+mc8FMt/svPLekZgwDj88TERejKqx2AsUv28G9G0WMDyCJ0gFtEFojS2Bu
	 BeJSg/Nuvqc9fmcT03ymVoM+kzTKSVePb+E5kE7QLi2k5OHfGDfkdKG8/t5Hk3wZGvwVP
	 PqyU8uygCU4TTRfpNXO9H1rxu+wDb47t5qAtP9Eh2t7TW24Yqbg5rNhEZE6ITUob5bquK
	 Uj2/6XWnQc+SLrRAWEXV/1IFIOzEG5QNBW6qQbuV7jTddSq+4tOGk+xkHqkjGV4DvwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794753631;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:Message-ID:In-Reply-To:
	 References:Organization:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=1bihxelyVft2t/5mQ9f11F3fi1jsaO8+e8OfSOmmVx4=;
	b=zkoB8gb2kp0Kkp1CFmdw2f4jqWOr6RqDrZezCrtMMdCWzTLUThykoyyqEnjhNffocrL4
	 fkFZ9aVLLqrbi5xgY79kVTeymdt/o5ZuPq5AMo/wkHRB1alibNpiVTj/qUVIBYEcsw6ug
	 CILyVGrwJB2BOO05BdKfj8piO/BJODXED+xI+nlwAkf3AKaPBMgBmaVv1vHvETGX5UtLe
	 jrY6B3e86NGEGS0r+blZINuubXZCSwmLx8DDmGHGrbn9bUSB5yyFiBZE94tZDEGM4uJgM
	 gKJn9CHpAH5pXw6nd98v1X/D1n3WmMuzmS1Lo7dsZ6MuLczv7ZFQB6rpPbQumQsPGSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=b+sEoWtI;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=tnD2earF;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD763606A337
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 14:40:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD763606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=b+sEoWtI;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=tnD2earF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794753629;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1bihxelyVft2t/5mQ9f11F3fi1jsaO8+e8OfSOmmVx4=;
	b=b+sEoWtI3YPxeWc19Rqv41UMQds3/kBhw9qdmFvnCBeEf8+zYq2o+fbalp9KTjc46UgLIv
	RwIFmUY8vjH+vjgttgKiiNYdve9PqNG2cJuDpAuR/M8XukvZ4dHj6pf2yZpY3SA5KdCRLo
	d6RwFrWykbHbM3rt9012N/Zh5A/huig=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-52-K3dqqIX6OjaChV31_HssoA-1; Sun, 15 Nov 2026 09:40:28 -0500
X-MC-Unique: K3dqqIX6OjaChV31_HssoA-1
X-Mimecast-MFC-AGG-ID: K3dqqIX6OjaChV31_HssoA_1794753627
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4bb68a5e792so2747195e9.0
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 06:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794753627; x=1795358427; darn=vger.kernel.org;
        h=date:content-transfer-encoding:content-type:mime-version
         :organization:references:in-reply-to:message-id:subject:cc:to:from
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1bihxelyVft2t/5mQ9f11F3fi1jsaO8+e8OfSOmmVx4=;
        b=tnD2earFINlcIWCgQkIzOvnuIK459bfYDLms9bXlJ8uCqxXDEN6G9D0zzS7mje1dQo
         mLOiLv0RLzLtixdajFswa6K3k2r3agMpSZlJ+guHHm0id9/TeeBsBvtEWEeTSxjxR2cQ
         BMysyxeOkHz6oA53uRws3Mg9pvQDHd/tS3JhqfCnFTQYAHj8N+inMMzAUCXipdx55XKc
         +ZwVSvViRsFvJyRtnKm6FiEA7a+IuGKJ9aaSWVU0IcSS2mSi00yyCa5mrYepPsbg/GUs
         UixNqaLbNjxS5qBWsnET7dH4tde7ttWo9E3pr4qvBJEaDV34x+mvgVs3Mbo2Csy5j/UT
         qmiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794753627; x=1795358427;
        h=date:content-transfer-encoding:content-type:mime-version
         :organization:references:in-reply-to:message-id:subject:cc:to:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1bihxelyVft2t/5mQ9f11F3fi1jsaO8+e8OfSOmmVx4=;
        b=D+4JYn9oiBOhA5bQQkolbIWCtL492GlCY19oFdx/nPPKNvXxzbgUMAqle6WAyDakNS
         9PV6mErBWi54ADlh+EAbvYb+uEWndTx17ST6OATamkMcENByYkJw+EmZe6kGVuhhyDma
         qRBQp8o7EaERwqYL0duEauqirJDl0HAOlK6rjgmi8kQa5MGycrbljknKLFXjltq6qjim
         VfR9zkhwO8CnxCv1AZSpCKNMTGiTaNzK+aExFvXDpd/Ht3jnuo0bXSgelCJ1m+k70tPJ
         jHmE9lWt+n+5B84TnIzEJRiZN6gDD5IjFHeHb7YjDIJOu18bkbQ0NaYzYeQTIBFfOVeg
         spPQ==
X-Forwarded-Encrypted: i=1; AL+hErElOdVRbZQpzUGxwftgmMqqimvDyWEfxWTuf5jzJo1kdrefcQAiRU5dTIc61Le+zzkEcIeONyE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/0Yy0XV/5Ql4gKm6UaxSMbZ7zym9f1RP5BYf7PJWNpyi3hMRem
	I5FkRyZiDHM4a6I2bExy5FRjzGOH6D+U3U6LotFlblAayfAPV9EcpYIMw7r/iiNJcTJOpJr63AN
	OIIjsNL6GP5mzMh6/1hp+9AesNqnw9kNvXG7CVsheQIhfFNpTz2W4RiArzg==
X-Gm-Gg: AYBFou2OruxbecjboQlQZCkw18QBvSO7ai0Cr6tRU9T8HJOeeIS353c3PzMt14Thv6j
	oiGuJHGA0TEtoASALxAMQaH1va7qd4xq/VVGuyTtdZlSpIcdXctXh031uQoV6E5aD+A5A7fZo1M
	ImkDCofzBT8gVCtC5jfHUv7AkKWbdekbsHnBMfuETaZKLDZ6GwP1TIHAanDkZ24JsAl/hvgXhb6
	7I3HVkwmpz59q6DKRiiMDSfKjLiHGotSmApCcfOQD5kLCr6aT9k/neUryHmQgeS7dcwlBjhlBF3
	pAzOr5dqrQGN38lyrgxzwWmMISvNhAi4NBHk0tS3C2LPmYcx04aiIf8rs0JM51wqNAJiBiHGI40
	yJG5+rQfucnN+TVBinb/ddc7vuCLvOszF0khG4DLmwTiRkVq8Ne83e7L+LffhbuBZZwA=
X-Received: by 2002:a05:600c:2784:b0:4a1:d49e:9ce with SMTP id 5b1f17b1804b1-4bb4e2918b1mr215622685e9.2.1794753626899;
        Sun, 15 Nov 2026 06:40:26 -0800 (PST)
X-Received: by 2002:a05:600c:2784:b0:4a1:d49e:9ce with SMTP id 5b1f17b1804b1-4bb4e2918b1mr215622085e9.2.1794753626265;
        Sun, 15 Nov 2026 06:40:26 -0800 (PST)
Received: from maya.myfinge.rs (ifcgrfdd.trafficplex.cloud. [2a10:fc81:a806:d6a9::1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d223b21sm18628968f8f.2.2026.11.15.06.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 06:40:25 -0800 (PST)
From: Stefano Brivio <sbrivio@redhat.com>
To: Eric Dumazet <edumazet@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, David Ahern <dsahern@kernel.org>, Ido Schimmel
 <idosch@nvidia.com>, Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, Xin Long
 <lucien.xin@gmail.com>, Aaron Conole <aconole@redhat.com>, Eelco Chaudron
 <echaudro@redhat.com>, Ilya Maximets <i.maximets@ovn.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Justin Iurman <justin.iurman@gmail.com>, Linus
 =?UTF-8?B?TMO8c3Npbmc=?= <linus.luessing@c0d3.blue>, Sabrina Dubroca
 <sd@queasysnail.net>, Hyunwoo Kim <imv4bel@gmail.com>,
 netdev@vger.kernel.org, linux-sctp@vger.kernel.org, dev@openvswitch.org,
 stable@vger.kernel.org
Subject: Re: [PATCH net 5/5] udp: use skb_set_transport_header_careful() in
 __udp6_lib_err_encap()
Message-ID: <20261115154023.41187779@elisabeth>
In-Reply-To: <20261113124625.4010206-6-edumazet@kernel.org>
References: <20261113124625.4010206-1-edumazet@kernel.org>
	<20261113124625.4010206-6-edumazet@kernel.org>
Organization: Red Hat
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.49; x86_64-pc-linux-gnu)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Date: Sun, 15 Nov 2026 15:40:24 +0100 (CET)

On Fri, 13 Nov 2026 13:46:25 +0100
Eric Dumazet <edumazet@kernel.org> wrote:

> skb->transport_header is a 16-bit offset from skb->head, and U16_MAX is
> reserved as the "not set" value. skb_set_transport_header() silently
> truncates an offset that does not fit.
> 
> __udp6_lib_err_encap() stores @offset, computed by icmpv6_notify() from
> the extension headers of the packet embedded in an ICMPv6 error. Should
> the value be truncated, the tunnel encap_err_lookup() and err_handler()
> callbacks would read the UDP header at the wrong place.
> 
> Since commit 3744b0964d52 ("ipv6: Implement limits on extension header
> parsing") a single chain is bounded to IP6_MAX_EXT_HDRS_CNT headers
> (24576 bytes), so this needs a large skb->data - skb->head on top of it,
> for instance after several nested decapsulations, each of them possibly
> pulling its own extension header chain, since @offset is relative to
> the IPv6 header embedded in the ICMPv6 error. No reproducer was written,
> this is hardening.
> 
> Use skb_set_transport_header_careful() and return an error if the
> offset can not be stored, in which case udpv6_err() ignores the
> ICMPv6 error. Do this before changing the network header, so that
> nothing has to be restored on failure.

Right, we can't call __udp6_lib_err_encap_no_sk() anyway in that case.

> Fixes: a36e185e8c85 ("udp: Handle ICMP errors for tunnels with same destination port on both endpoints")
> Cc: stable@vger.kernel.org
> Signed-off-by: Eric Dumazet <edumazet@kernel.org>

Thanks for fixing this.

Reviewed-by: Stefano Brivio <sbrivio@redhat.com>

-- 
Stefano


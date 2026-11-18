Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795043823;
	b=X7BX9ASu5UPR3NHJv8Cw5qi0wsPW50RfiYz0NypIqZF9YJjDTPzyCz5bnVK54d9002S4
	 rN72SnrxL6z/4ugL0bEgDTMDPitCeZy/J7ZlT9RB70ubraUbWo8iqd6nOcx/Pkp+CO/GU
	 EXbOQsGLS5zDDV6h1MvzoLTjTh0ABq49N2QfljpGwMxPlP5Rn1uOoRj4eaikr0X3IDj68
	 Imdw5HzQeDM/1ah2xSSk5gBJYxlrbC0Swhc5KMsRH0RPZw4lXfZKIr2MXQOrsatO5Z2Dd
	 ZG8CSsAeR+PixJLQTjArk/qUmRjQMQTX08snth9zfUgQGx2CjLe46Z7k95uLdcIyyng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795043823;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=mPR06FN+DshFSRmXQRB0czKqJie1fc17yG9r9Wz7WFI=;
	b=hPwQn4u9Gs1QRSDG7fnGLSkLp9dnbOJ0yq7nG3ZaBRDyzn1pxU66A5MkL+q6FSDDO5ek
	 eTa0m0k2OnsDDhhsWq8hLA1u7AmoUHEbfOeH3jvADueMRKxBV/4F5CtYEfLwveBU1Owq7
	 /iFhLu3nUv9QnipaNOP4n0Z670UkF5blEUt6IRtt5wZTeFvspDv7Z5yzyw0+e1A3y4rLT
	 QRUBWqRjEiAVumyASe0BZkZPBlbamphx02aVi7C6biZgMxjQ7QXDmoTz5ipxff6CkOJ8G
	 1foCillRSA0JEejpvzNX4ouAFjtt3YDO1RN6LbkxCKokuEutUPiZesQiE/R86yaz+1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wGxdAVzU;
	arc=none smtp.remote-ip=74.125.229.2
Received: from mail-dy2-f2.google.com (mail-dy2-f2.google.com [74.125.229.2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345C2606A325
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 23:17:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 345C2606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wGxdAVzU
Received: by mail-dy2-f2.google.com with SMTP id 5a478bee46e88-327b1d5824fso1096805eec.1
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 15:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795043822; x=1795648622; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mPR06FN+DshFSRmXQRB0czKqJie1fc17yG9r9Wz7WFI=;
        b=wGxdAVzU55D/UTOdKilRGohvnaaIPVWd86ia2R/x3qv+oyPmY3pdJTBK/VF5mnItDq
         iVLpsObynSXM2egP56umevRyki+uSG6qQcgMQgIUXLDHRSzBYVAa5ynAgYe1k3d/1Vov
         SgOwPCf+wVT5d/biw4qJPEqKRB6Qr9nrHdKbk88z3C1DciiFOqet2foTdqMBnjcRHE9V
         XGFqcKqjveK5xyDEiRow16NMDNFBDPrLaVn282ofacK6Z+NEkBo30G3STp5eTY0yTtRN
         0JEwJ1zrI4/UOcwujjL1iBXYs4c9tpEYjGaQLeReckH5Lyi5cpPQGxLBX/5rrwU6Q/QS
         KH9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795043822; x=1795648622;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mPR06FN+DshFSRmXQRB0czKqJie1fc17yG9r9Wz7WFI=;
        b=Zzndz22+f5R/iYsBCxATHXKpeLBVaxFUtliOyLAK/K4qwYMBjMEnUawV/ZCYi84xnB
         K/mJqxBUh78L+cyNeMUBSZuVMlt6zT2vP033n0j/Wc/kCEUMnmme3Ro7Y+d6egJtira6
         oFoiRHPbmRybqriDnoKj0MZs0GDblbx1Jnt6G5fj7Eg/pTYzG8Daz6rEN9XFW9i594eM
         isIsSvY+vv0KIV5CCjloqF49IBKUsRL5CiE6zJApbhD79ezcG396lG82SN/HkPeZJkur
         3AmMIsjVGE1uKKa2r3KXq7daVG2CJzGxpV4Of3hDy5fcYzsNNKQJ33jSjnG1+PfkMjw5
         fjZA==
X-Gm-Message-State: APuU4Z83drfoidGebTc8SRZ1gdlp2aIQXK+USAEFMoi858HAcMd/hWxi
	8CVD3nOwYjVxdf5+Cap4Qmoh8hOapX/7yLGAZlERORxJ5bMyCjv6yMa5
X-Gm-Gg: AYBFou3tmubK4BTSNz3oPdJPhhUd1AKPZI3mCwIdn4cRlfE67c3Lxr19zmL423bb58p
	VJnOFJ/jH8BNkLmsRZe2Bs51Iv1f8JknK/ylODJm3s6WjYKPn8WP0sGvuvEpyPN4nVSScD42Ia5
	h0IQ9lIOf/Rp8+1LcfFC2d8EimD6fV3al1imyNJzR5hLzNq03kMqs1vXO7VMClcxJKM6FETdWEJ
	Q5Bx7AV8rOVOyr8ED2Xg03YFPKdXEcPWU6C5l80wOWbekdUCllpRSc6bqz8pIGB8B5jGZRmhLEE
	aVpJ96xwX/M51Ba4BQKITP7mgERnmopXRFy/I7WAi05QR3xFGXIn8hKjoDpN3cZ+9c5Tv1lCUmi
	c8xPpAUPhdtwp/Y3TX4smCB6ETPjwXurH4IUEbnAbvHlSh2OKnKorANvJ7uiABRYGNelpZ2miTa
	y8xeeirDGgT/zcEMfXndO/MV7ehg7n7/Kc7drZL8/B0JNNZYxcGDGjz62sxpAautVh4J6GHVhDz
	Sz+Kbq8ca6rsMQqqty7EHpJ7fkfzlR90pCVS4Wvmafwh5rYPZcNp1QAVAZuXWn7x8eN2ZLuCagp
	e6UTIn2WbCpgHjvSRqQ9aEA=
X-Received: by 2002:a05:7022:ea8a:b0:1b5:1a5a:1dc with SMTP id a92af1059eb24-1b543be9b64mr3808568c88.12.1795043822125;
        Wed, 18 Nov 2026 15:17:02 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:43::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447f4eafsm9021578c88.14.2026.11.18.15.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 15:17:01 -0800 (PST)
Date: Wed, 18 Nov 2026 15:16:55 -0800
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org, Eric Dumazet <edumazet@kernel.org>, 
	Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org, 
	Josef Bacik <josef@toxicpanda.com>, Kaiyuan Zhang <kaiyuanz@google.com>, 
	Willem de Bruijn <willemb@google.com>, Bobby Eshleman <bobbyeshleman@meta.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Pavel Begunkov <asml.silence@gmail.com>, 
	Daniel Borkmann <daniel@iogearbox.net>
Subject: Re: [PATCH net-next v5 3/3] tcp: propagate skb_zcopy() uarg in
 tcp_mtu_probe()
Message-ID: <av4x4oM-xxCmymSg@devvm16445.scu0.facebook.com>
References: <20261115004003.3695475-1-almasrymina@google.com>
 <20261115004003.3695475-4-almasrymina@google.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261115004003.3695475-4-almasrymina@google.com>

On 11/15, Mina Almasry wrote:
> tcp_clone_payload() takes references on source skb fragments when
> building an MTU probe skb, but never attaches the source skb's zerocopy
> ubuf_info (uarg) to the probe skb. When tcp_mtu_probe() subsequently
> frees fully consumed source skbs via tcp_eat_one_skb(), skb_release_data()
> drops their uarg references and can deliver the zerocopy completion to
> userspace while the unacknowledged probe skb still references the user
> buffers.
> 
> Additionally, tcp_can_coalesce_send_queue_head() only checks
> skb_pure_zcopy_same() (which compares SKBFL_PURE_ZEROCOPY), allowing
> adjacent zerocopy skbs with different uargs (or a mixed-zerocopy skb and
> a non-zerocopy skb) to be coalesced into a single probe skb that can
> only hold one destructor_arg.
> 
> Reject coalescing across different skb_zcopy() uargs in
> tcp_can_coalesce_send_queue_head() and propagate the uarg to the probe
> skb via skb_zcopy_set() in tcp_clone_payload().
> 
> This is a pre-existing issue found by manual code inspection and LLM
> review; it was not triggered in production. Verified with the net_core
> KUnit test suite; not tested on real hardware.
> 
> Fixes: 736013292e3c ("tcp: let tcp_mtu_probe() build headless packets")
> Signed-off-by: Mina Almasry <almasrymina@google.com>

Acked-by: Stanislav Fomichev <sdf@fomichev.me>

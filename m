Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794949041;
	b=Nzd020KjiS0dbXUuhpIy0U/4m1PigRbBR8suhwUwT2cKFPkF+TWdnexnasac2/PPOpKp
	 uTWX+1CRNplalZDWhp6k2EV6GF+HA+aTKUqmvWP1wqe5yzDznPcEFCxdh4E5dusYtBMtj
	 Crb4qPPItSJXmQkt1VZ1302l0SmpxLGHW9OHWP2wNz1HsWOGXJ6rrfgdcUdFnI5kOMjkD
	 nCLpSxqkVAHxavzbByVOwBGyNE6CC6iab6em4oXDz0xf2Qh15LI45XyqAmc4dw5aXgaJk
	 EQtETPNGCnxvQa4N0PD1lFFIK2lpKwt5mNSXTqcRGPsSvEGko84I3a/+8+2NDOv20rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794949041;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To;
	bh=xJYRSoH4guj+EsNxTlD3hMwy4BVgc6CPsDY4Mrde2lU=;
	b=Z7aIxpUMgmAnkIGnI1bShl74QUZLZvCz5vrm1tIn90IUkVv3gXOlBY6T4laxSV6xxOdo
	 lOeaj+w7mPg7ZHkZcuIwJG2NHpY8fewf2czmcQbSCRLdezrqMixtvLOWVvOLTRjdFJVxF
	 A/iD6HS23vHBpX64/HMGOJE5SLvSZh9WVzE3ELDvjLysRGEFdb7fCbDZtIantbYWUItQZ
	 q+R4gp4E654+GpkZU21bV5Lf2TnCwf6izFOs7+YC9Sj7hFqJRkR7g+D5NXMDS5jOWxqP+
	 FU0zFvGLFrRuq3X3eDhv2PtaVL2b7RNsbec4y+/zwp1GDBQaDJCrFQmWCSNOHgXfnNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="oActs12/";
	arc=none smtp.remote-ip=209.85.219.45
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535EA606A32C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 20:57:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 535EA606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oActs12/
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-91e8938fd01so1333966d6.3
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 12:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794949040; x=1795553840; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xJYRSoH4guj+EsNxTlD3hMwy4BVgc6CPsDY4Mrde2lU=;
        b=oActs12/xBkJ9FwqcYoMoPLl8nH0F0LqGDn5xR2oN/Z85LKpMrxDplxdHMCDpntfFa
         lj41w4AvWV3P1Fx8Y8Hwh4jEL019FVOWGbwy/x9vctQbE9NviFebnMyg/qHIWeUutNBQ
         IWCoz6IlyIvV+9t50BqXQ616Grhj49TV6Jrnf00W2kXMONKAASxCA7GcIFTiGajORVu0
         8durIc7MCP8fMMNV59YvkhB7YmCYyAA2LgYdBK24dI9GbPPX085ZCRQuJ5ysKGL4TZui
         luwWfiNNu4OrgYy9LdovfSfjtfHCZI6pnAqOzGYBnEKtEpIUM30yrLtuAcjgFotAaCCC
         nU9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794949040; x=1795553840;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xJYRSoH4guj+EsNxTlD3hMwy4BVgc6CPsDY4Mrde2lU=;
        b=gZDd/wlYJvkL2q2E6ae++9crqDyTH27o3RW6aQQN7+Dhgt/Tc2/RBDdrZQ0Epge3t7
         P2GPG29COujM74C4fQGz6std/XDS3bDN3p5ul0Nk5XGaRJqPs92HmIZ/gc5z5XGTDeAh
         M5NpSLfu+ZhQYh7lb5AToc1hqDfmSS6o5TGy667eOrGu2tpGV6jiSvrZhGuJC1BnaZV1
         303sglZ9+UxOgD3aGnyq4yS9YVusvutf4ce7yrZnB2RVPlIpf7j+oTK1SMm56oDWorpG
         1s2hxf0HSdg0icgelJAtYujxX8kWZwBSNEj4UnIVpQtpRXE89iy0nlIezG8W/DdTft+S
         RvLg==
X-Gm-Message-State: APuU4Z83b7y68mZlrEzIUuJUXWMUfNoWbaO5/S8gFzZKU7ykOjZ93aFL
	xsPCVHB/XD954B9m6/ZfP8OvxPSRxqaCbUHq8GxDZFBLHbP8mi1kcZ2e
X-Gm-Gg: AZFdTZfB6aiw6Km1avQ9VGPRlxIiwbrFXN4FGv+WzeeVppACnoq5KRhT2Jv/QvrYyk6
	VRUx4cqQqbSKywJTRpoFzBUsOFI962mVpbmT6SJUE4z+lcTz58Vul9JJBrrSSUEvgZvhnhUp/bJ
	vaWPh04vTR0PPTb8WWLwzTHt/poO1TCmIskunQ/KB8xrlkKn2gayawffDf03Rqd1HUu3eTIARNG
	PGdn66EVV08ZVCtIz3mGsckJ9qkjsyRu3itZFCtVpQtfKOveNCBS6ue6RZ0HBIH+qZhjLSBxc5F
	Yjb566YFAvNkNad5FqgCINx1ymqLSfyCbQEc/YkaKiVgpYCDPgx/xMptUIvc0RpYe7PrKTGENIA
	GooU9QxIcuaxm5hJJNC1VpcsNKTs9eOBtUQ5w6hySSlGGFlJFuECt8ZTlkqx70N8XuCUu9y+J5/
	WjNGzLChOM7qNiauBaW0p2wUeCzGA5sFdJWsewD7y+hFtE4Xlo30NnHVXxV/kg/w/SF9FmKV0fp
	u5sBJLDI9QhLNTugNzgG0wW14Bt+yC/Sl8flpA5K1qxoiodpkjUSrqnLVYo5M2cJaGi3Puo7d0M
	yJCj8WTaid2pBsbXmLAqzB/Vxh97sx07zbECm9hZfCBFHred4LaPRz8=
X-Received: by 2002:a05:6214:262e:b0:91c:7c53:152d with SMTP id 6a1803df08f44-92114dd31d4mr7334636d6.29.1794949039986;
        Tue, 17 Nov 2026 12:57:19 -0800 (PST)
Received: from localhost ([2600:4040:9399:4000:e553:72e5:7d37:c7ef])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92114d70c5csm3329646d6.31.2026.11.17.12.57.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 12:57:19 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Nov 2026 15:57:17 -0500
Message-Id: <DMXSBWB0425F.1NVVQK5JZ4IIW@gmail.com>
Cc: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "David
 Decotigny" <decot@google.com>, "Madhu Chittim" <madhu.chittim@intel.com>,
 "Emil Tantilov" <emil.s.tantilov@intel.com>, "Sridhar Samudrala"
 <sridhar.samudrala@intel.com>, "Brian Vazquez" <brianvv@google.com>, "Li
 Li" <boolli@google.com>, "Alexander Lobakin"
 <aleksander.lobakin@intel.com>, "Daniel Zahka" <daniel.zahka@gmail.com>,
 "Willem de Bruijn" <willemdebruijn.kernel@gmail.com>, "Kees Cook"
 <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 <linux-hardening@vger.kernel.org>
Subject: Re: [PATCH iwl-next 08/15] idpf: psp: add support for psp rx key
 allocation
From: "Daniel Zahka" <daniel.zahka@gmail.com>
To: "Stan Iliev" <stani@google.com>, "Tony Nguyen"
 <anthony.l.nguyen@intel.com>, "Przemek Kitszel"
 <przemyslaw.kitszel@intel.com>, "David S. Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@kernel.org>, "Jakub Kicinski" <kuba@kernel.org>,
 "Paolo Abeni" <pabeni@redhat.com>, "Andrew Lunn" <andrew+netdev@lunn.ch>,
 <intel-wired-lan@lists.osuosl.org>
X-Mailer: aerc 0.21.0-threadmapfix
References: <20261117145522.1910636-1-stani@google.com>
 <20261117145522.1910636-9-stani@google.com>
In-Reply-To: <20261117145522.1910636-9-stani@google.com>

On Tue Nov 17, 2026 at 9:55 AM EST, Stan Iliev wrote:
> Add support for allocating PSP RX keys on demand:
> - Introduce VIRTCHNL2_OP_PSP_ALLOCATE_KEYS (560),
>   enum virtchnl2_psp_allocate_response_flags,
>   struct virtchnl2_psp_allocate_keys_request/_response and
>   struct virtchnl2_allocate_psp_key_v0/_v1.
> - Implement idpf_send_allocate_psp_key(), which allocates one V0 RX
>   key with a synchronous request, validates the reply (key type,
>   keys_size_bytes, length, and an SPI with a key ID, which the PSP core
>   requires) and wipes the key from the mailbox buffer. The key, its SPI
>   and its master key generation are returned in struct idpf_psp_rx_key.
> - Implement the rx_spi_alloc PSP device op. It gets the adapter from
>   the netdev of the PSP device, as the vports can be freed while the
>   PSP device is registered.
> - Keep a copy of the vport ID in adapter->psp.vport_id, for the same
>   reason.
> - Wipe the RX keys of late replies, which libie passes to
>   idpf_recv_event_msg() after the request timed out.
>
> Signed-off-by: Stan Iliev <stani@google.com>
> ---

[...]

> +int idpf_send_allocate_psp_key(struct idpf_adapter *adapter,
> +			       struct idpf_psp_rx_key *key)
> +{
> +	struct libie_ctlq_xn_send_params xn_params =3D {
> +		.chnl_opcode	=3D VIRTCHNL2_OP_PSP_ALLOCATE_KEYS,
> +		.timeout_ms	=3D IDPF_VC_XN_DEFAULT_TIMEOUT_MSEC,
> +	};
> +	const struct virtchnl2_psp_allocate_keys_response *vc_reply;
> +	struct virtchnl2_psp_allocate_keys_request key_req =3D { };
> +	const struct virtchnl2_allocate_psp_key_v0 *v0_key;
> +	size_t reply_sz;
> +	u32 spi;
> +	int err;
> +
> +	BUILD_BUG_ON(sizeof(key->key) !=3D sizeof(v0_key->v0_key));
> +
> +	key_req.vport_id =3D cpu_to_le32(READ_ONCE(adapter->psp.vport_id));
> +	key_req.num_keys =3D cpu_to_le32(1);
> +	key_req.key_type =3D VIRTCHNL2_PSP_KEY_TYPE_V0;
> +	/* key_req.domain stays zeroed: VIRTCHNL2_PSP_DOMAIN_NONE */
> +
> +	err =3D idpf_send_mb_msg_stack(adapter, &xn_params, &key_req);
> +	if (err)
> +		return err;
> +
> +	reply_sz =3D xn_params.recv_mem.iov_len;
> +	vc_reply =3D xn_params.recv_mem.iov_base;
> +	if (reply_sz < sizeof(*vc_reply) + sizeof(*v0_key) ||
> +	    vc_reply->key_type !=3D VIRTCHNL2_PSP_KEY_TYPE_V0 ||
> +	    le32_to_cpu(vc_reply->keys_size_bytes) !=3D sizeof(*v0_key)) {
> +		net_warn_ratelimited("%s: invalid reply of %zu bytes\n",
> +				     __func__, reply_sz);
> +		err =3D -EIO;
> +		goto release_rx;
> +	}
> +
> +	v0_key =3D (const struct virtchnl2_allocate_psp_key_v0 *)vc_reply->keys=
;
> +	spi =3D le32_to_cpu(v0_key->spi);
> +	if (!(spi & PSP_SPI_KEY_ID)) {
> +		net_warn_ratelimited("%s: invalid SPI %#x\n", __func__, spi);
> +		err =3D -EIO;

nit: seems a bit defensive not to trust the fw to provide a valid SPI.
No issues with keeping it around though.=20

> +		goto release_rx;
> +	}
> +
> +	key->spi =3D cpu_to_be32(spi);
> +	key->generation =3D le32_to_cpu(vc_reply->master_key_generation);
> +	memcpy(key->key, v0_key->v0_key, sizeof(key->key));
> +	atomic_inc(&adapter->psp.keys_allocated);
> +
> +release_rx:
> +	/* Don't leave the RX key in the recycled mailbox buffer */
> +	memzero_explicit(xn_params.recv_mem.iov_base, reply_sz);
> +	libie_ctlq_release_rx_buf(&xn_params.recv_mem);
> +	return err;
> +}
> +

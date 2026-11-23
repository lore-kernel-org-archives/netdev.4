Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795468212;
	b=ilMP7eS2uWoW1/F0qCL2/Z1NFXGFFD+/VTy8mAJo598HOzhNSDSGZo23Uhctp7zuzOYX
	 Dd8gP7DqqO5876qBagSgBI+ujW8UAFaNaMqwVA31FbpCh8c4IdsK++MzIDmFjrp1pRMwh
	 S4+KclF1lgpaRqmJi2bHuzLAlrDfRFInVi002z8WlqADQPsKfISjl8fnXZJYZoIFmfsue
	 dqBnrnVL2IWitvyiHgEqV+mKEYxxm7r7SffQqbhJrd0ZfObFkcuyi6sArFsRfceAR8E0E
	 A3FAe/yjoowWQOSqe9tlZRZr9oFdz/sNrNKfLIyCWKTbd5x5d6dAjLcf7to/XYrZjLQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795468212;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=FkFupnOVJ01TJ277CJauG6Yuwd78xHj7FKn66yy/ozg=;
	b=qRoQWf31eMzFC1pNM10TI1ozspGFz7O9bxdeC5dDNMctGipYkOcnP/qv74CpXdrP4rmH
	 opJBjUcbz4ATu0eUqqz0+i3dtRNOglITbs322AuqaOnatqE4p47l9WV0f5F+qGf0ZowZe
	 Mc+KBGXjyA9XkA+0lCmO6CMx2ekfiNDiMN0JXjOxpnDGdAfeGGh+HYtqs7HGqc3pOC7NH
	 MG0RQMgqwoDV9D8+lUt9BRYs99cFRSPVZVOJ+4uOyyWecvSpKFtD6vdnBPtb1SI/aOqAq
	 9PbkORmlB3NUI3Kebwc1pnNT+njFQodbq3WQGF+PkYnQbGoXoCCyQb4nW5uQChcziLw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t3g7GyJt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4CB2606A321
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 21:10:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4CB2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t3g7GyJt
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4b52fcb410dso589542f8f.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 13:10:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795468210; cv=none;
        d=google.com; s=arc-20260327;
        b=XrhSVsF/2vkFZLn651Gj+sa4myFum/nOCmlXXiaKmhVyIszr80NgfHbQr+F06+hUIT
         PM+OJjc1xz9YJioLCHfTmLjPDVGKOeqgKpVAehyq4fnIP04H+AXrAffzKaFKG7RIQV61
         UPcM+XMKDFG+6r9nBnI2eSBOb2XtRsRSTFYwqA/8T3ZztPd16nXSNFDlS8P7jGqLQazo
         0u6LhkD39UoHyoKlEpkyiiWXES6emvLQenKUwJ8zvDvGgrUVvN5vfv8Vd2ny2BcTC6wS
         pN/0A/kLRfBZfJ8WV5+gmCsgIrqgVRq5/b+B3UF8K//DqplCkqMvgTVgqOADxEiigKV/
         u5Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FkFupnOVJ01TJ277CJauG6Yuwd78xHj7FKn66yy/ozg=;
        fh=t9iI5b544YLHtYV/o6E42+ujyuAx2KYxd2PpjUSf49Q=;
        b=V+Hk/ToqIRdstmTLvB/VLFfGe2vrmpdkskxvphMLIz3MRfml1iWP6mdmwiI4PkOq5j
         fkSOFZuYTOuNZzcK8bN5ViW/dF/WMrlR3MDUogvMQNdCkf8BaQoF+abc7w0WVAnFFs2R
         qIlpn4O7KRViUENO5RuBpmQGCuAa3ik6oyEFidhEgsZzgMqjmCd1HQHQpzYBBX7hye/a
         PKLz4qmI3w1y8Z619IOoiy3XuygsVrEtTSpNzGeIoHHFpn7DFBYywbwdUKRNCSKt4Q9F
         35TunXavisLRRbsaF7Jv9STLwepp5sS7zzvUoJMgA61rQDsyvGENLIcHfnfOstkDX/GE
         XOXQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795468210; x=1796073010; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FkFupnOVJ01TJ277CJauG6Yuwd78xHj7FKn66yy/ozg=;
        b=t3g7GyJtwhMX1x8ZL2WFJs29JilYgfE3oPg9GqJkzW2/a4hDdWwN4YQdsKtMPUSl+Y
         WormZIi1f9MdGg5PjupY517vwh0L/HpexfzxdTpr3GHl6Aj6Uavpt+gpqQQRHGzcvjSn
         Wfy3dktyucN/aHAt2prqYst70ld+UQEKAJG1782o8GC6dMflbYVIJsE4BLnv7olMa82C
         GFzGC2RbfloewJ+m6VA/ZlmZFkPrNS1WaKYQ+kujghH7Behun2suuF5AO7PASYMSJ9iz
         eNj/kOE0b3YfwcqBCCumdV1v6z+Wg51J0MJfSwpkjmYBtZxIvR1S4cQkzrQk9+stmfYg
         /X1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795468210; x=1796073010;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FkFupnOVJ01TJ277CJauG6Yuwd78xHj7FKn66yy/ozg=;
        b=SSqjfsqEpyiTYjC0p/EeJGaVIQJ3cEqPBTpDAMRko5Zx1RMSUTpb8m8y9Qu6qJA6Xu
         v9mf1P5+LzXjwm873JBvwNS4rYOAUqDSJcN3ku1CU7H9qiLvxl9bmPNgLpAhgz/MrVuC
         dAx7cIOlJTENx3MEzLk4H5o9mJJUhIcSx2bCIXmeF7oW2ZzT3LAVBfrBUyEC2CRmllDC
         sgK7ZcX0K574FOXdLzvjw+OJsWQadTNUupROwqxiAjTxRVd6co7qtUYY6Msrt45Nd3oe
         ZWr085oIcQHyRTRXnk80/BHj+ch5jzmUI3skyds+wXbu71mu55EILbM/rxSi7iuHcE0y
         LT/A==
X-Gm-Message-State: APuU4Z+lcDjUn/U/vaPRX2yDj+SmDkkhKhgf4ZpL/RTlH8M4USWM/DPC
	9N5KmeYKijcNaPPRalk29ilerQ4tbG1dMRvP+Y62OK8FCE4EWFXRiueU1t/24GcediZr1iAgtRA
	AvtVa1F3FiHumOosX8GN2XPb4zfscaPE=
X-Gm-Gg: AZFdTZdOHTAFyTkOGZNji7kOTkTz+6FaoCBxY5k7DcuHRJeUKZ64VAPdtOhe0IuukVU
	aCkZnCcO4v8erFCpgMpICvjr9j8hBJEJvg8S0gZaugUk9SL4GEUj5DKy4RMwVBR7zxXslbNWIKd
	Ga3zRz4oZbHrXwc1t9oXBu5Dg0H6fHNdpkpNb0Xqc4PbAdLN6VHIZqbchzLONN2ViqU7Jm9uvRF
	rQh6c1/gvE8WE8/3UDlR69FVYw0D3u8tJQ9+lWR9qpgzTLXDp/S4mwED3u0G0cdEmLCqGE3veD4
	5I4juRE42I8vXClevoS7VHJcPFORKjztzjQ06d0c4d9Fbv6kFqYxfXYt/srB2SLCmQzecNhx6YA
	TFKUo4EK/ssNBRVNams2sk7xfhm4AzzE8cIpaLMXi0vSgkn4XPSE0Pgq1HBUNk+svyOurRuHoxT
	YH22E/wy0qB8W5xBi8RSvNN3B5jo9czN/Z5RvMpMPP8BRytTiqQbaPeA==
X-Received: by 2002:a05:6000:2903:b0:491:c392:1f31 with SMTP id
 ffacd0b85a97d-4aa5ab788d1mr32985157f8f.28.1795468209755; Mon, 23 Nov 2026
 13:10:09 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261121012402.84848-1-tianyi@cloudflare.com> <3adef4b4d528780bae31f2fb02d0a08bf9c8ebd5.camel@gmail.com>
 <CAG4wq-f18SHytDb39SdJYzRPk-dzECjH_HCSiMGAQ721Zmfomg@mail.gmail.com>
In-Reply-To: <CAG4wq-f18SHytDb39SdJYzRPk-dzECjH_HCSiMGAQ721Zmfomg@mail.gmail.com>
From: Alexander Duyck <alexander.duyck@gmail.com>
Date: Mon, 23 Nov 2026 13:09:33 -0800
X-Gm-Features: Aa3M54rzlNA1FR82U1PdfiFY5TW0gboojcKZPxdPIZcmX7lagtS1GzjDMw4zL4w
Message-ID: <CAKgT0UeWWherBt1MDcPF7R7jxt6E_3peo8VuxrgY3JdseM-0rg@mail.gmail.com>
Subject: Re: [PATCH net] ice: do not report CHECKSUM_COMPLETE when an XDP
 program is attached
To: Tianyi Gao <tianyi@cloudflare.com>
Cc: netdev@vger.kernel.org, intel-wired-lan@lists.osuosl.org, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	Paul Greenwalt <paul.greenwalt@intel.com>, Alice Michael <alice.michael@intel.com>, 
	Eric Joyner <eric.joyner@intel.com>, Jesse Brandeburg <jbrandeb@kernel.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, bpf@vger.kernel.org, kernel-team@cloudflare.com, 
	tianyi.gao@linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 12:35=E2=80=AFPM Tianyi Gao <tianyi@cloudflare.com>=
 wrote:
>
> On Mon, 2026-11-23 at 10:49 -0800, Alexander H Duyck wrote:
> > I'm not sure this is the best fix for this. If we are needing all NICs
> > that support CHECKSUM_COMPLETE *and* XDP to report CHECKSUM_NONE in the
> > event of a frame being modified by XDP it really feels like we should
> > probably look at moving this further up the stack.
>
> Thanks for the review, Alex.
>
> IMHO we should first make sure XDP programs do not cause "hw csum
> failure" in current kernels. Whatever an XDP program does, it should
> not be able to trigger a hw csum failure. It's not an uncommon use
> case, e.g., Katran from Meta [3] and Cloudflare's load balancer. And
> existing selftests already do it (test_xdp_native_adjst_head_* and
> test_xdp_native_adjst_tail_* in
> tools/testing/selftests/drivers/net/xdp.py).

That is exactly my point though. What we have is a divergence between
a number of the existing drivers in how they handle these things. As a
result the behavior is currently different depending on which NIC is
in use.

For example, one recent one I saw was an issue on the Tx side where an
outgoing XDP program was modifying the frame and actually not updating
the pseudoheader checksum. As a result it was breaking Tx checksum
offloads for NICs that were using the HW_CSUM that used that checksum
header. We could have fixed it by forcing all the drivers to
recalculate the pseudo-header checksum, but instead we pushed back on
the program that was making that change.

> > Also even if we go the multiple driver fix route I wonder if we
> > shouldn't look at adding a new XDP return type to indicate that we are
> > passing a modified frame
>
> IMHO that is for net-next. There we can add optimizations, such as a
> way to keep CHECKSUM_COMPLETE for programs that do not change the
> frame, potentially after [1] or [2] is accepted.

The point is you are fixing things for your use case, but anybody who
is using the CHECKSUM_COMPLETE to compute the checksum on the frames
and using XDP without changing the frames will see this as a
significant performance regression.

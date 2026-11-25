Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795631513;
	b=4TBrezXmZ4zVLJ3ccoXdhr6WwEdxMCjPKklGVa5fpxon3HUDh0/EScEVNtbSNuFtsNq9
	 ZrsGArbpvuU/JT2j9aXDboOc2L1GpXvrLe1l8WhRu+ZWGNtAB5qs65nwl0AS6DgfJy0YV
	 hZYlWXzZ7K2y/kXXfLYojwDaDYcS2qe6KCXq2NRixwGyEobak8cl3hlW7SeqYCGDTY+A+
	 E7L+JUm7Hr9dYMvfImgw3+LruOWyw3FwCU7trSVa2eYzkIkdqBZocz29EGVtc4uXsDde+
	 eU70KpcBriUwlykUoCfbxjbM2zuJsk2LYjZgoL6/CN7JmJdPLQ19QiHZn65jm0pRRHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795631513;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=c9NWxL0URY5wSNoGWrryAkeMpSu11Af5bqDWyaekRIQ=;
	b=RpbFcV/oMYmA/L1zOp3lkVY2zfNNpa87xMjgLwdrt1LefdwZdcOk706i1F/73nV37lj8
	 sJE5vRwZsxSIW644WGNWDuiZ54eLDnps477yk1U3W85V2Pz2cufU6r63wot2AaV8U6Ogn
	 kUPT5T/0tsSjLPgia2WwjZtFLoJhziOI3FXklHwGgKCfqzvqxwxIr8Wpc+gRZax0kBg5Q
	 EFTpvoIC9tkB3Cuqt3KAfpTEqVu9/cA+om6T4/RQ1TAXsxKeIWHKVBPFXjFAt6QuTKGe2
	 z69pWiYwkpMhJiOv3pgTYPluS8SxlIUslQmj3zFIIEXjPlrpACkt6aHC2XIenv4YhFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=aw1a9JAb;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850F2606A326
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 18:31:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 850F2606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=aw1a9JAb
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c516a1623d0so633431366b.2
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 10:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1795631512; x=1796236312; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c9NWxL0URY5wSNoGWrryAkeMpSu11Af5bqDWyaekRIQ=;
        b=aw1a9JAbqZNeXN/uQOFkv/A5Bp+ErDRYSZtNb+3O8jd8/FYFaaZW5YyhqWuY9PmP6Z
         NOXKeasRmYrqB0agWOj1PHJf1AFONdaA6PHNlGtTMCqzQ0j1BJUSwGVLag4jWrh40thr
         Mcmv4LYbb1Nq5MSMMZV58sWSrs8WbV9oZMBQPVowkcRz1GtDNjt6Ss/XZ+ximZ8UIb+I
         BsO/7nwIuaJgLegTqTdtUdBFTtbf+IUgLkBRFcZW1/x5pn2GiksScU8LUGBCwCR/mt+i
         d2R1MYTGeSW3SdW36cHEuhzrCAmx7qO4apSZubpwbl3ncOnAET+apmjFCVKf1wJSZR6K
         At8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795631512; x=1796236312;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c9NWxL0URY5wSNoGWrryAkeMpSu11Af5bqDWyaekRIQ=;
        b=EjSvgPihpI1c4k5xhl6yHFHKd6AFwDcjy3oNDqy0gj4e55XlSmt3ZrpHv+CO9SzPoJ
         zqrYy8LRimoNYVxUCJhDvqFH5Lwgvd7vJGaDo2cllHm+U1NgBEDnPXXt1HDLBUN6MJIK
         Pz/XmojqO1EOcCsKiR9x1CWwqG4WhMX8xJv6+n9WyZcqcQsEz0khrDSkYGOrNtjZ4ODf
         SvfWsMcAPYglEounTA6OqQL/JKx0QPXPBbOr0nCR2EiGs5DX8ykM+gyLkSkRUQqYolCE
         BuXXp66Rdr7I5AcaaeMG7nUPmFixNyoVwO/YXvFZB74nI1G15JdouAKiFssBwW+mn95B
         fMrg==
X-Forwarded-Encrypted: i=1; AL+hErGy5FInMrZ7SRzT/yUypiRvYb9UamOLj32oNWeYsm+gymh6X60TBtrW8qaOJXVUyehHyPCMbxs=@vger.kernel.org
X-Gm-Message-State: APuU4Z94/eKJiJMBk0vV0O3NvNWLF3ByPWwXltVFWv+7l/37+Q2yA8HH
	HilC3l2n4D0BVF0OqJCKSE/WQNXVQmJ56KRb3iUxDCqLJ3bbUrmjScsFtPXT9UMDi0Y=
X-Gm-Gg: AZFdTZeVjCHV8ir0HCC+1h3oiCCeOctdD4JsgSSR0QYh2p2WeCHl44Raz9vdgxFXTIk
	g1nFWzPBW97zAO0oDVsSrYdpwpfW8y+VPTgAHJJLvLWn69+rhDgdHG/PuOzKVcOHyTS2lH0VZ77
	AaU0f26o6j0UGzvKae2iddPqGc5vWpt78Zg4c3Rm5BbihKbkRsz0YUnXCYtoBQKbvsyrCDDFP/z
	doL1l/vwpAU1Nlrp20jgW3XMqLvP6GHrn1kvp83I04JxSDwzY5JEvhHcKcheQSaH/nLSPCLbACO
	QVcdZF0kzaZ45V1ENkcQst6w0SDj81/hf+nk4wAHpN0915Xwq8JInGZ9foo6Snbb+PEQz00vudS
	836JPOCzCXBjga5Mt2Du9bpm/v0uNJ6VJCe/4tAu5ZWOQ9+ZNxO6naeyZ7nyxlQpqLCEuru8aPJ
	VlntlaQ57f7+1ImrVFFWBg5OuOm/zLDgbrugzE7J/M6KCQfxkUeYdaNEwYKRMfxPlaV1IQ7nEMt
	H7RnUS27B5znETCzKrP4XfvZ/sx9NrhG03KdaxTsigmjn7PNSmvLzGPdWVRMpVRMwh687aqdZRg
	DjrWcGRNazc1wo+XcceW/FZ9DnUDdyEJosAyw/WBmsPpyps=
X-Received: by 2002:a17:907:a88f:b0:c46:d493:501a with SMTP id a640c23a62f3a-c513a8410d9mr1669468866b.22.1795631511890;
        Wed, 25 Nov 2026 10:31:51 -0800 (PST)
Received: from L9JK9NPFH9 ([2a09:bac6:37ad:1e5a::306:5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afe01a0sm686554566b.68.2026.11.25.10.31.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 25 Nov 2026 10:31:51 -0800 (PST)
From: Tianyi Gao <tianyi@cloudflare.com>
To: Alexander Duyck <alexander.duyck@gmail.com>
Cc: Tianyi Gao <tianyi@cloudflare.com>,
	netdev@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Paul Greenwalt <paul.greenwalt@intel.com>,
	Alice Michael <alice.michael@intel.com>,
	Eric Joyner <eric.joyner@intel.com>,
	Jesse Brandeburg <jbrandeb@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	bpf@vger.kernel.org,
	kernel-team@cloudflare.com,
	tianyi.gao@linux.dev
Subject: Re: [PATCH net v2] ice: do not report CHECKSUM_COMPLETE when an XDP program is attached
Date: Wed, 25 Nov 2026 18:31:33 +0000
Message-ID: <20261125183134.25863-1-tianyi@cloudflare.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <CAKgT0UcvdZgtNtURJGPqAJ3dPGnCpa1DbpX_KBbEmoK==WXNSg@mail.gmail.com>
References: <20261125095201.98279-1-tianyi@cloudflare.com> <CAKgT0UcvdZgtNtURJGPqAJ3dPGnCpa1DbpX_KBbEmoK==WXNSg@mail.gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8bit

Thanks for the reviews and the ack, Olek, Przemek and Alex.

Also adding back Maciej's ack, as Przemek suggested:

Acked-by: Maciej Fijalkowski <maciej.fijalkowski@intel.com>

On Wed, 2026-11-25 at 09:11 -0800, Alexander Duyck wrote:
> I would rank it up there with the e1000e jumbo frames packet
> truncation issue/fix from back in the day
> (CVE-2009-4536/CVE-2009-1385).

Thank you for the pointer. It is interesting to see how it was exploited
back then.

As you said, this case needs an XDP program that changes the packet and
still returns XDP_PASS. So far I have not noticed a way that it can be
stacked with other bugs, but I will keep it in mind.

Thanks,
Tianyi

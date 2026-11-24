Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795553133;
	b=G8dWNR5ODzQ4J2y97IOAT22hmS6WcPN/HGEAOXOflb78OjmNe83ogwN6F5N1Nx8L+FsV
	 rIJH0tfgQ5p7JBvVnqczwhYm4X4HcBU0dHIhsMatM79qFWReRzsXWnGmLdxxZKUKqAyzm
	 duSDTAH1WBE/qglPy1TjK4tmpTB6nIcQLup18+ZYzmHlXfoimOBC0m3clW+9PBydjVVrX
	 e1IrMPBVm4sp1PuhirkJ2gJKoBSc0Itciiaw0ty9KPvezZKo/eS7vLbksWV4CuqsRYeiZ
	 tfT6JO4ajImKhS7htBz3kWtP1X0tZd83WGvx4AfHJt4QAQd3YG5TRQKSwOP2LsJESxg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795553133;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=KFzLi3vzdDSPGhuH40A8wZRyinBPu8g/pRL5DsdlYi8=;
	b=EJzf6ee0wbe8p0laz45+xkXc2zHDl3tiusvlXxXRwXam+wQG88Vc6mZPl0jsRLBuEW/B
	 Xocge58niAjIfSO4KbkFurDDXV3vePft3umSUJdDkVwxoWYXCeEtu/7aTSQxQ4eDx6FBA
	 6X1xSqDpQaFRxoQaLQ0XNPWPQfU/8Deam4JNI7j4ZYtzf+gDOh1Tkc3WwXPeGDWXDYON4
	 Or1ZZjQVEqh59NxDht1x2bJ+SN7tPdSgo36gv5RBUYIXUulztJIALyXyIQ4PbSur09WD7
	 k7KE584Aw5MCZFI2RY5pqfHAKIDJ4Qx138nqwvfgtmrtrRAoBcQfxc+2Jh67ks3Nsog==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=fWkfI7g7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.176
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77A4606A330
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 20:45:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B77A4606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=fWkfI7g7
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8b4eab91bcaso27687237b3.2
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 12:45:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795553132; cv=none;
        d=google.com; s=arc-20260327;
        b=dGMRdKyDKZtKBu6SI0QuahlYWRyRLY52TqFdLU/spvzj3T+683vAXRRMDrgQlt+qJM
         spGkTYdTYCjN2HFt97PqxSlmp3eRvTuEJKdgc13BIA5TYT9SNCmvqYqagQfaThzKDfeM
         wXQBoh0pLcXx7aSbMIvFXyvk37FRmmahvnW4i6/ZvL67KBc8vFCpW4kej1xHI3HgoBSi
         Q5hM67ngxljWiYRRA14yOmH5w8PFGHU8mJpbMEeQvkH+rAKKUtCyCQVIbqLU1AQznuxL
         Jb/NncZ+ZR9rPFEGwVGcfYhTPnOeE+LXx8H2yQRF0ZzkLCCOOILp/IBy1W3uRqfweDNz
         /iSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KFzLi3vzdDSPGhuH40A8wZRyinBPu8g/pRL5DsdlYi8=;
        fh=e5FVgfiiB1hiCP+loaMMneG7c27SMb9pB/uyFSJxIu4=;
        b=afu0mfCd4Nxquxyi43Kt0OO6eU3O6Ipky1yXkzTJLdjctIPG/7F1+WtwuczxPPss7A
         H465O5kU96+zwSDLPxa4EHIwiz6gzHQNij0n2jXZYGiXaIQACYDN43mzief8DPfDIfpU
         IUGcT4fNi8utrSHaUnr0G3ONvsrzYt6kGP2xb9o9fSv1Fjlw7zzgeKXUEv+lLCNwFNPg
         c+Wgv6fq+IEsM8dT+JmzJ7zJZWFaE2+5Loc0sZtl4gzc92Lufwy0th8v+0w15mk7ROxr
         j/8GQ1u8LfM6ViYB6abOg/US+gPFBVPK3UVIFTvBK3/BkUUhaeMK6cfOye4fGgs/xN+a
         ueFw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1795553132; x=1796157932; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KFzLi3vzdDSPGhuH40A8wZRyinBPu8g/pRL5DsdlYi8=;
        b=fWkfI7g7PrLQ7bt+0UAil+Zy7J/2gPJX50pDHayXK+EpqLlR20gEcua4dazCanX3T5
         E53HaM4usZB+CE/EUBt9WWedRTs2GcLHHZMNdI9HL+DQWjWIvORceM10ZdjtTOKgBdL6
         aJMzVftA/pPwii3PvCGJApDKR1SH7WIDniYyN/fnUEkj9dyewvH9yCmNioPAwUhpdzIh
         hPaq2LbyV86n5UydtCwC0x2FWZIn2eZHLO4E1bGxrFsWWM8scZG0+Hh28SugR8pD9uh4
         98xRtzbCiLQjlnMY7czZmvRaYZUmtvYPyalncM69vRhfNSfPjPAVyEUYLYPyxyOx3xpZ
         PRPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795553132; x=1796157932;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KFzLi3vzdDSPGhuH40A8wZRyinBPu8g/pRL5DsdlYi8=;
        b=O78fek/DLrSzzyrHBVa7HjgQuG1XuKGUXjcOURfq3ADLywJ0mS+4hSaGp5P7O4jdtP
         CD2v3dS42zp+sDmrmcnXH04aGnmlo0sdVVFuhZHr6+4g4dqYeB+mFYv/20gr5HfCAjaG
         LoJZ4vI0QLV1twzXabH71bQvKLgqluigKogOXZaTrtyEYwgxpYp4M8DvcneH1TTai4mT
         tm0TH9UCQ2ZcUufRO0LI6Pho1xEn3QK0q9CJPTa7LM2rR19PCuadIiGp90fGyvdu4NMp
         nhOPtN37TUEULC6HeSYph5u/ruqFnINucL0ghQEI/0+zf9D1k1QDiJJJOmupU18duKIK
         og7A==
X-Forwarded-Encrypted: i=1; AL+hErHAJ5TKsgTbF/miJ93bXdxL5y2bONT097kdzHIko+UZXqzUQZkoKjTBu/7WWcrJ40dJe57aK30=@vger.kernel.org
X-Gm-Message-State: APuU4Z93OWQArxb7xXi6OBYy+gbZjQ5YlHbW/yTBy59Fg5FlGduE/Xmv
	xdme+pMRve9emAZcw8OtWky/m3C6QNdxhY4YS1V/objNBiffJBVoi1Jxd5FBGq826vd4AoX1HEd
	KcpEpyokeqxEvFRDr7cR9yZR0UrdZttA=
X-Gm-Gg: AZFdTZfVN4vb3/DA6xCPcrdu7PU/TO53M752WJcdrNO2E/BFfNpt6eXXvP0Bl81SJr1
	oX2wCkOUcayLPReuw+brTnvlNuZTH5YSoxbvIzzqH/587tEHBoSPJapp+XtJyrAbRoZ9VWlR3dE
	xA3HjfcthWoFGQ6C0VaZHzdH8CwB3KDssRy6ppV/8GvKTXwGb8VN8q7ZlGT2VcGt0z1bbTrS6bQ
	XjmBzpugxzHghqZQRIDRG/KERzqUDB+YYQcS8Iwh95Uf4LrSprcAAQ4qp7xpvyjgSO/ogjY618z
	4BeMw45oKz2M3VzJ7pDjXOdbc9SAoaEhd8+PUXTYtHj8jcs+tYOFuUnKq3wS8Ls6APdvgMcKwii
	MyER0ucLk12BTP76jk1u/hA/1sIgOWBvrCeRht/VuAtggLVXFG+WfxFqQK76uzjAxCW1fuh7pFe
	cf2/Te1CUn4fJdgW2k
X-Received: by 2002:a05:690c:799:b0:8b4:d584:6165 with SMTP id
 00721157ae682-8b52043ff55mr69264227b3.21.1795553131511; Tue, 24 Nov 2026
 12:45:31 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261121213102.143130-1-tanure@linux.com> <20261121213102.143130-2-tanure@linux.com>
In-Reply-To: <20261121213102.143130-2-tanure@linux.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 24 Nov 2026 21:45:20 +0100
X-Gm-Features: Aa3M54pybnp1CQPsafQYDf0P2DptibC917JzUwMw-x18aat2wfvVMhiMsv1rR3s
Message-ID: <CAFBinCDPGYpR6rmtJvN5pT1OdSN-ne=YJVeT0kk4Ff2SB2vraA@mail.gmail.com>
Subject: Re: [PATCH v8 1/4] dt-bindings: net: amlogic,g12a-mdio-mux: add the
 T7 compatible
To: Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 21, 2026 at 10:31=E2=80=AFPM Lucas Tanure <tanure@linux.com> wr=
ote:
>
> The T7 has the same management bus multiplexer as the G12A, in front
> of the same on-chip 100M PHY, and the G12A driver runs it unchanged.
> But a device tree that names only the G12A string leaves no way to
> tell the two apart later: if a difference between the two blocks
> turns up, every T7 board would have to change its compatible to get
> the fix.
>
> Give the T7 a compatible of its own with the G12A one as fallback, so
> the existing driver keeps binding and a T7-specific match can be added
> without touching the boards.
>
> Signed-off-by: Lucas Tanure <tanure@linux.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795549910;
	b=z0Kp6evGMxVGOJFtsJPuMzvvGtQKS6fDgA3Nk2b/8zI7yQ5HfoZkAtDVpi4a5QARCt7n
	 HOPURiT1PCsr6097xu5S6HjITwYnTejXD8LuZXIU3aCsDUJ35B/oiyjTHw+d2rXTuJp95
	 wv+3HfsItClaRSUqdArmZPftEQYzn3uU/TQcXFj1RTfE6QbyH/JbageXF6Jx2J4KKgYTd
	 ehwCbOGkHCCQ3YtTcHq8iBnWB6g+04oeQYhCxU1txfZSpDyVCAz7G2fFqH2YE0XIRgxRb
	 t9YcOU5YLosUfMfonj/p2iTyp3qaLOQm7bsBhhIaQq+iEkCWzAwIaVQuqP41tHxHoiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795549910;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=0xxfXHhFtKfjkqyqcsfFPM0ROkNnOJpRIbccoi8xK4w=;
	b=TRPSCFpxexntqRTDKToeDofmYyDrqamcjHUPK9xwM3l0yT7Cmo7h5/3t2BORaGFtaFEb
	 61BOYYbgPAsuH8NCdjD2iau0ptHivLtGMNT5mAsbeDF7lkhd66qLWBlpYvuLuZe0EhcPm
	 gExqpE+jTFegnbG+GI4wrc3xOyjZffTc7OnXy6ot9c/FCG6HiuBDtAtcEI4pTLej3Rc0u
	 a0DADpkmQry6Ok80mXiQEeMxYnWbn7d0H2V8bnWCAOCAxggK/HsNPNwAuupl0n/OCw9xZ
	 kwQq8uUjEUp95IUOUb3KU17qbUTfrHFqUzqo6X2+OV9/gr5bVLy015hor0lqCrJyjcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xllrdZnw;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4151606A684
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 19:51:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4151606A684
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xllrdZnw
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b43d30822fso2515317a91.3
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 11:51:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795549909; x=1796154709; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0xxfXHhFtKfjkqyqcsfFPM0ROkNnOJpRIbccoi8xK4w=;
        b=xllrdZnwkm+pubWTFuN1lJ6YR0/wK34LHx9gNIsRUT/z5BSLXFhEqcs8Pxg7EL93ZJ
         3FK3ltGzVVBXgLReBnHIgtnD1QiEdkC7W9LpG5Oe32AoHfpjLdXkXos64FAbJrJpgokl
         PkzdvgHOaisJN16uijwFP/G4klxWvfrr5aoe5QNlfT98XKfaxeos2NFNfZGLS1IIjznK
         0kBkOL5TafhjY0Qr25JTMirxdW03ds8AKxgQRrNBBMznlVc+BXSGUZiCmDSYXlr8f/dJ
         7Vzeobsd8/uy3bk8tYmiZ2EuaMHUCdkWS9yMea6UUcWcFtKT3NztJSkEfhiaQuhyGuv+
         FnMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795549909; x=1796154709;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0xxfXHhFtKfjkqyqcsfFPM0ROkNnOJpRIbccoi8xK4w=;
        b=qZGsqyaRKPLU3G2R/3vgM6g34vG5sNNxVfPSEfIS5HHqc8Tc+SEDsPbXbbvXeoBH6P
         5XplEsFqjunX4396dS9/2xpH6DkLQbp3VsEKnGhWNRZoRnOn0+GJ3qOhcoxO0NMer4pp
         d7RfWdv91BaLsVyy0sVKemU1cjBz3mXy9dqhR+xGyTqHDrsFzsm1s7vwTIbye9mKLffb
         kOZtRWh0oCrVduirmxr2HL1sWbt+xkBsKpwjV9eoXYvbehEMw/SiR000Jfuuf++BNoQz
         TxSkXNhoVvfxKgflSV8DZd+7vq62TDaOlP45uOb3n2yd4Mkd/9w/RI8Ab5qXnFyFMAJb
         0IMA==
X-Forwarded-Encrypted: i=1; AL+hErEUVi2PpUp0f6toaaeeDtKdEAcMWcVb40cvYMzXhtB2WDH0OjLscW4U20HOiG94WH8svAHPbxY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8m96d920kIsCULOhRVbeOCh25o3ClGlu0w0jSevFnpRZO4bmne
	1PUhSJOb8Xx+aHnDhaNnUra9jOD85K1mIMHeNRFe0brOhy19WzQWYXkf
X-Gm-Gg: AZFdTZdx3KCqoQqufCpvk++GP4EMhXN91eJXcaTYQfx9pzLgMGke3eL4tpfph3to/ce
	L6Uvx412cRyyPhZo15o3eOFdB/MLJIgNovYw/wNCDAmiMLaaqJQuBi260+j/6COmjqASkmlTKEO
	uAUse89JNjyy9bY+RPhxWIK6CPNsxY6lnbXNJ0MabN2WNHHLsPzpvQUxVM517fdoySmLwkg7ie5
	U3FzsN+xBENQzTBO2ejvhVv2ae/g5otjqSiHwmg13lRYU/jnqAf7tPujLva9X0ztVImtUkz3dSj
	UKLJIaaq9S8V0v0hf9CXOVQiuAns59Cfmt3bC2fG7IHn5lZnqb+xV9UkwTPg+CITSgU6h3ROGoA
	6PqIHYtQ7Y96TF5HbdbpdqAMiVDVGIn+FwV1M6CHDtZtacwQ1cPeUpcouZwMnXSTMfy+6Bkc33Q
	TuQAl4qPXS6ghF+P0rxjlEj/lew7dfq9e6RSQMNzz02GZJclFbNPFWiFU+TRZ4jlulfCqxc63Ve
	p9mnBKwCXgyDTvVgZtE2fcsZy1JKrt7IHNgki/TZT/do0pZxBDZHlpOeS7GXNQGHuPP4wwJcTwe
	+t106DwP3DY7zebcFU7jIGjjnr8x419MWGnlujp9Ny8RO8m+rdgZyMendojQRhyAsk6sVyZXktm
	6gWEMfssay4Xe0f4j9CoBO23xx2DF78iYag==
X-Received: by 2002:a17:90b:5847:b0:3b4:6094:2fad with SMTP id 98e67ed59e1d1-3b4609432acmr9064199a91.48.1795549908783;
        Tue, 24 Nov 2026 11:51:48 -0800 (PST)
Received: from localhost ([153.61.198.245])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41abb1b66sm24987505a91.1.2026.11.24.11.51.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 11:51:48 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Nov 2026 19:51:48 +0000
Message-Id: <DN3PBKDHWZF3.18F6D49JMJ2AH@gmail.com>
Cc: "Stanislav Fomichev" <sdf@fomichev.me>,
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>, "David S. Miller"
 <davem@davemloft.net>, "Eric Dumazet" <edumazet@kernel.org>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Willem de
 Bruijn" <willemb@google.com>, "Simon Horman" <horms@kernel.org>, "Daniel
 Borkmann" <daniel@iogearbox.net>, "Jesper Dangaard Brouer"
 <hawk@kernel.org>, "John Fastabend" <john.fastabend@gmail.com>,
 <netdev@vger.kernel.org>, <bpf@vger.kernel.org>
Subject: Re: [PATCH bpf] xsk: keep the charged page count when pinning a
 umem fails
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Kyuwon Cho" <kyuwoncho18@gmail.com>, "Magnus Karlsson"
 <magnus.karlsson@intel.com>, "Maciej Fijalkowski"
 <maciej.fijalkowski@intel.com>
In-Reply-To: <179552079829.1290967.12345053263834529704@gmail.com>
References: <179552079829.1290967.12345053263834529704@gmail.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Tue, Nov 24, 2026 at 05:03 AM Kyuwon Cho <kyuwoncho18@gmail.com> wrote:
>  net/xdp/xdp_umem.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)

xsk fixes go via net tree.
Pls respin as [PATCH net].

pw-bot: cr

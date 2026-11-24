Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795479473;
	b=C4JxCfnWijf/5PqpyR3nCa1OJYe+KwkHOGYgfBZWq0bWL6qndjZpCmNnyvVyLkX6YQC5
	 DKSyZWiKunw4ktbsAJBNDDa3NDkpp3ShhEc6BZ8YNoVOMO0h/sQNdP+edJzWM6MrshyKq
	 JxN7r1E9rU9HPlAHC1YI22ESXTG6Cha7Ujk8noiawZXfLw6Vm99T3gBrxMRrWq6XjGhlC
	 Dgy+uldVF5338XVFayZYfr84Tdf56Joibs9EwNGsvsiXmrzjdqxU/3gM0IeAQDntY+Dit
	 9BX90ho6H59jXIQ3JkXhev5bG+R5XTgrP/64eqvQYkaQgs9yKNC+iyKSSwCtLHNY5JA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795479473;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=+f8XxVCKUeDTBInFaSnUJudwLzQYi3S7MYVKIfTz7Oc=;
	b=OQTkYSzUoektvSuVanuJSnA+gVjzuljezFJ1Ge/K3bBdXhd+tTVyAnh62WIXcEJRPL/m
	 BFQ5sjhVK1foYZ3EvJOA3bs45CPsHdXTBdYCuog+zga49Lc6LASmg9E1HdMr8+5JnrfSE
	 5nDMoItsTMtTZdoF6aJ8F70jH7LNB2HHgAeHBerW/RoPMsMTnwxcPjskc9jPUCK3e4Ha4
	 1RalBTdhsEmfTNa2ioHuByvgL5vaGnUsSovoU/PnCHmdP5N7AjoA8t7fJKaDyUO9RF9RG
	 hLYZw/siFTcgG2mWoaFwZI+V8ywxkK/GlGSc6CYQ7KxGGF2yYeBOh7FgMngbUeYksWQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PxhniXz5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3EE606A327
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 00:17:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A3EE606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PxhniXz5
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb666304fdso43764555e9.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 16:17:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795479471; cv=none;
        d=google.com; s=arc-20260327;
        b=RuxVPmE/ZEyLofg5Yv0ydiS/+JZ/cetlWgJ3ClLHP8viq4wwrXY+5fkgLR9xvcATB2
         e1Zj/pVQOFkSPsrDvSdtbR8L4h/7qtfhefu4VVTm93FhgGPElg4SqlwrOff+8nBA4cOH
         5qPRFoNlhhNrnATkdVGngxnVlq5u6J5xrC4DwEFu6BE+bQD86BvYuF2DytmmumjOYVSh
         CiNyQVygvRgkX8Uj0Jqei2lQoW6KoltHJvdLAzSqxadWzScUSSxsesgGM2a/e7EWEVmo
         gokcbGT4KJxl7LmxwsqkJ9T7TQjN0MmFv31WQuMRw9CoXYXSrfQJfLm2TG/Bkd3s9DgH
         iNKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+f8XxVCKUeDTBInFaSnUJudwLzQYi3S7MYVKIfTz7Oc=;
        fh=t9iI5b544YLHtYV/o6E42+ujyuAx2KYxd2PpjUSf49Q=;
        b=JdN5FE1owqkalOzrAT5OhUpTEEpDU06MOjlLuhBhmQWzh58+ppDO71oU50dSRWnxlY
         qN1BRMN/m5Jm36Q25e6ipUGbsj4W2cPQdup7wwjkdBHSX1nqLh3R09v/TrOaD6kfhzwe
         xtkYigLRV7Y1H2m5hg2kj3EubF7i1sQzMFJrspp/At4rVw88mharXhTwFbj8JB2hMivf
         VoS4SvCwxK3we2kzl2WaCT2VK+ziz+zN8GHXdsIIhieuK+mq8weau0EVI0X4D4nPCQmq
         btZzj8bSgXz6XQEU4B6Bc2W+/5SUCpyP8fH+cEwOAVW/ToF2xhuIuEJASa6Dn37QyExy
         3bcw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795479471; x=1796084271; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+f8XxVCKUeDTBInFaSnUJudwLzQYi3S7MYVKIfTz7Oc=;
        b=PxhniXz5jQF4hgCrFr92HbnEexVxKmoD9VBYCGU0mXGRGi4PgEwMOSmeomKaqluo6p
         k1Ko+X/GxvUaQdfcc8nxrEvq2JRw+wV21E07uPULK2bS3YC9qumSaYGuQtm+HTYW8Zco
         iCB5lVjpDpdzwfX8bR/giXmI94ok0iNU3IjoHBXmQkLvSLCrinmDwYVmOFMUIqKK8k6Y
         0ueoukijZeOXNyEQ01eSB3QMOMFz2s9HFNBpuOU151FgGxivNhFNObjU32f/t9xPRAKW
         dZTWPLl0jYP06RPZ1XNm8igIeMmSY/Mfpd2v3F9bzzGZ3DCg0GieqPdWzy8tSGexAO8F
         ikhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795479471; x=1796084271;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+f8XxVCKUeDTBInFaSnUJudwLzQYi3S7MYVKIfTz7Oc=;
        b=ahtkGnUZmSVQElONtCYbhsciJ2g6PQWiuh6VNay4H9cned3r5Bji4dTJd5gGGykKUt
         v6xZXCcrEMo/d/aKhe8IKEW1ZT5nH++M+LQOLOB2LBImm4q2a8/1OctQI3GWbCzgQrQW
         Wz6YzT74Hk69FXi9aLP5RWWonLw47a2v9vCpPlrXSUO0tyWahFs8rM4zcHUI7+40pkJG
         Rfhd+RqUrw3W+9mPssjoKSR4vSkOdMMAlBLl/8aAwLERUOzDGnjCA7CPrCXrd+vQ1Qzl
         FNUWD0h/l9bpa2x/G8ga2vdnJ8xcn53QiQmumYJFZ7JX8tbXmZsdy7D2qMOtgDMliUUf
         /1AA==
X-Gm-Message-State: APuU4Z9g20x9dl6JOo/PStU0Aiq+EvekFDw/Z5d7a16OZZ8zQVoRmKxE
	qJBnhizclIAlWOrvilYGjq0qUKWplLL2P0PuKSTLaLcGSz8unuOo+HTc/Wtq3705lLBn9/0ly7H
	9PSiLcPvgb7TWvvzPbwB1qIzgWooW4f4=
X-Gm-Gg: AZFdTZdCh8d7BBpkbS4ncKe6wLm8NN4zARx1li8NP5QU8b/E8MYBmcu2+7SoDbQY2Vd
	MY3VkmPv+y9LTYR3rMVDobMP5/JW0FCUUbwsJ85xlz2+Kv1Xfsy58GriWVoieSREn+FE+kaY4Je
	f29c6QL7TdPG5NbqDccY4d33okAOlwFHdWc9cpUqhF1qLrb5GzvxSVeeGPVdnUhXJj9gRzRhlho
	AowOJe8b3ZcljWSCMssAOZVB4DBd7S8gsIQHxwYtWAXzoXfm6XMuEerUJmfU3zMDVafzGNYK6iV
	WvJZELx9cHpi4bYkLAVy73tLvB0KjylJVzf3JI+iWycLwVZnzft3Yf85HIwpUkD/Y4ewVxtH7yU
	NN/HA8f+QQ3TXDKmzBOiGHSQT3jGfM41ajgUDkHc+i3g1E8JVdDmkMk9HMtZ6sLipnhKp3xb9x3
	c2le4J64Hm66najsMeFB4HKDVbuEhVz6Z+QWiJlHpZ4DLUZlWJ3QJ3p/M=
X-Received: by 2002:a05:600c:1d09:b0:4bb:66fd:ad68 with SMTP id
 5b1f17b1804b1-4bb888160cdmr282174825e9.14.1795479471368; Mon, 23 Nov 2026
 16:17:51 -0800 (PST)
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
 <CAKgT0UeWWherBt1MDcPF7R7jxt6E_3peo8VuxrgY3JdseM-0rg@mail.gmail.com>
 <CAG4wq-dizUz-6GB8Aj1wRTQBOzbHbT7pX9gom+AhR=5OWSyjzw@mail.gmail.com>
 <CAKgT0UffmbELMsGi8HRfu62MfC9VRYZ+TMNKFjZMWJyrV4t3jw@mail.gmail.com> <CAG4wq-cG1bseTFczZTjashN75J1Jsrv=u1ccuRsY-N1kZ=SXXg@mail.gmail.com>
In-Reply-To: <CAG4wq-cG1bseTFczZTjashN75J1Jsrv=u1ccuRsY-N1kZ=SXXg@mail.gmail.com>
From: Alexander Duyck <alexander.duyck@gmail.com>
Date: Mon, 23 Nov 2026 16:17:15 -0800
X-Gm-Features: Aa3M54pXq6mr_CU1bdkLP3MSJC2lLz1GXmfjYby6zsKSTGadaC_FLxjN5Btbots
Message-ID: <CAKgT0UeNyyXKARjKR4nVVxNe3UB16WuXqxSz0cf4ZvCdb9A4_Q@mail.gmail.com>
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

On Mon, Nov 23, 2026 at 3:26=E2=80=AFPM Tianyi Gao <tianyi@cloudflare.com> =
wrote:
>
> Hi Alex,
>
> Thank you for being so responsive, and I really appreciate it.
>
> On Mon, 2026-11-23 at 14:42 -0800, Alexander Duyck wrote:
> > In the mlx5e case they were disabling the feature via the private
> > control flag if it was enabled. In the case of your change you are
> > just disabling it without exposing that it is disabled.
>
> mlx5 does not change the private flag when a program is attached. It
> sets MLX5E_RQ_STATE_NO_CSUM_COMPLETE on the RQ, and
> rx_no_csum_complete keeps its value ("off" by default).
>
> > is it falling through into the CHECKSUM_UNNECESSARY path with all
> > the indications that a tunnel was still there even though you
> > stripped the header?
>
> Yes, the same path as E810, and mlx5 does the same with a program
> attached.
>
> > The issue is that the driver is making a number of assumptions about
> > what is there based on what the hardware parsed for headers and such.
>
> This was discussed in the thread of [1], including the decap problem
> with csum_level. The summary there was that reporting
> CHECKSUM_COMPLETE on the XDP-to-skb path is unsafe, and that the
> safest option for now is CHECKSUM_UNNECESSARY only [3]. The decap
> case with CHECKSUM_UNNECESSARY was left open as a known problem.
>
> I am also working on the long-term design in [2], though there is
> still a long way to go. Please take a look if you are interested.
>
> For this patch, my aim is simple: stop the "hw csum failure", and
> make E830 with XDP report RX checksums the same way as E810, i.e. as
> before GCS was added.
>
> [3] https://lore.kernel.org/all/20260721183256.6f49d6e1@kernel.org/
>
> Thanks,
> Tianyi

Any reason why you couldn't just strip the GCS enable flags from the
rings when you add the XDP program in ndo_bpf instead of having to add
a check for every packet if the XDP program is present? That would be
closer to what they did for the Mellanox NIC and wouldn't be adding
code to the hot path. Then it is just a matter of also adding an info
message that you are disabling this in the log so if somebody does
have to figure out a regression it should be more obvious.

Thinking in terms of what the final fix for this might look like,
currently the drivers are already starting to carry stuff for frags to
determine if they support jumbo frames via frags or not. I suspect we
will likely need to do something similar when the time comes
indicating if the program can avoid corrupting a checksum or not when
it is stripping headers.

I am not super thrilled with the idea of this becoming standardized.
In theory this would be much better if there was some way to pass the
data out that the frame was mangled and what the checksum adjustment
is to the total frame. As it stands we are probably going to be
getting CHECKSUM_UNNECESSARY on everything even if we don't expect it.
For example I don't know what will happen with an ICMP frame sent over
this tunnel. I assume it is likely just discaring the
CHECKSUM_UNECESSARY since it isn't used.

Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794805718;
	b=Pv+KbkCDm6rmvjZCsLLX5ypZCK//Ew64XXRvBi1TjPiZyXVm8JzXmcPjeJXziaaHp22U
	 b8VOgI8vYVT9vnVhL33oVT+I94JWqEeRb8LovMqDWTru3FDLvurHSUfuv14dq7Oh7s9od
	 zK/+0fwKVsseMotBRmrTN8L4Qj29/6FxrMfyF0OinGVorMj8XECFDJAaUCK4ZK6MTMuGR
	 x6rElKKm48zDlEyX8AgGVxGoBLnNRgkusC0X+6WjK6509DG6GoH5KcvjvQ3agXIF9I0Gl
	 OCKvoOVHIBVULIStHT96h90iGmNa/uRRPo0CeMq3+qYAcQQjNtOOFs1rNfakaLKwAew==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794805718;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=6PFo0gWJ6YoLoXoUQd+pgr2q8m2qzjFGTHMpGL/07IE=;
	b=kzxTe02YFTvQ8uxIN05yN/th8YanSkkUyGjLttcW1/i8NLCjEVk16i8HK1J76uC6z3+q
	 avy/55CCBRlp9UDslyKrIdt9jMoc4AQWZdkTUG+nt+99OX4Zab38PfW9zb878nBRrWJ0x
	 eHTV1wYATIfIyGnF+GzQc1MT5n/PxDq9ZRXCkllJoNdQOfRIBKXGmUF86atU95LMU0xtY
	 xy3QiiDvOJS53q3AzLJOZzshlayVSEZUzHce9PK8a0sg+bRuJakQn/6vSwEO9J9PKsMYS
	 HTX8Nmw3yY/qALxG8wHmulDpa/8XjE4hnM0+QQQWhYHZLTGkMpXfmzvHGlJ/aBFVBhA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nebusec.ai;
	spf=pass smtp.mailfrom=nebusec.ai;
	dkim=pass header.d=nebusec.ai header.i=@nebusec.ai header.a=rsa-sha256 header.s=google header.b="TSy/b/JZ";
	arc=fail smtp.remote-ip=209.85.208.174
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDAF3606A323
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 05:08:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDAF3606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.a=rsa-sha256 header.s=google header.b=TSy/b/JZ
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3ab30b3212aso28015051fa.0
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 21:08:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794805716; cv=none;
        d=google.com; s=arc-20260327;
        b=TWhq8SJ0Gfh9fSMgOIOSWELmms++W7te9J6IPNMoOFnTzLfSqeFUBAHcRYF+HbMcb/
         t6BgLmAsOQwk5VUg6ck+zGPAP/gZp6ab9xZco+KmwkVX+pmpmb8M8nRR265iPkNOkVWm
         2bgxjvnPuPCtwolmCC7ZzqXN/5YmyFLqAwZ4ilCPZ19MWwUNOlMQdZ0pLEq5q3FobNRo
         DfWIBH6FoKA0SR4S20b77M/p42noSOSbVSfdqfphPmbYihSsc0vBFRrOcNKG7q2oyXi0
         gppMowNFQxU4wRcWx+ObOFzIx/rEDf2YURUVi//sCfqFYHM23j8U9akp14DRdYPd8xWQ
         W62g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6PFo0gWJ6YoLoXoUQd+pgr2q8m2qzjFGTHMpGL/07IE=;
        fh=3mfsQftyhGKvS9Cao1X7B5dnl1GjONHiFZg10Bfk+oQ=;
        b=KEPqr6sUrwHN95DDSQU3NiHXM8CkgAHRjICmgQg44pym7n3Ec4eF4Wgrpb0hf17raq
         VcsP2Ish/F8KLi7tgbTGaTwQW0MCL81IJVme19H9pDkqtao2F1/rEfYH2Y9K3PUHwaqS
         FVOMwhoIyRe7zfmmomyOmDu2Pg8BQaMkhp9gaIqG9pKFE0zzmQa38BvczBiQTUOwoie7
         k20tMwUTK+QV8zgnpzi2Czl8nq+8lHecAp8sl/83YXSzWzb9z8tUpcyATWS5txV1dHcB
         D7KdhQLLy71J7FcX8ixZqetPQ3kxD6NbBXiMg0UMUEE/hvw4bmmfn4k6ww7n/h7N5F6+
         eyjA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1794805716; x=1795410516; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6PFo0gWJ6YoLoXoUQd+pgr2q8m2qzjFGTHMpGL/07IE=;
        b=TSy/b/JZ2wjrU2kStbBSWztm4DWLTNtNkuEVQ7pOSonZKkWP0IBhO40JXqIbv6xtsH
         e45tsQPt0CQtbimH33l84TjBbWKqZZwVJaaoirP1b3P4tlG8NPWEhZzxnFoadNR/RSQA
         HbZvJUoOqPIo+01MoNKSbPbdjJ+cu4o4wjkR0tdTx1DHFUws6d310scHTpOwOFlSe5P1
         Bzi0iE3iqbbdP7ibe0LJItvBOj1voUJ8QBqUrMqT5lzFHsub1R1Vz3x1uAmSRscWngJb
         WQs/5c9W8fruwuYsuoTcldvxDHd0rKHjibZeF2KfunYBHPjGXPLuUefltnycSX/n2JMP
         1ruQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794805716; x=1795410516;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6PFo0gWJ6YoLoXoUQd+pgr2q8m2qzjFGTHMpGL/07IE=;
        b=x6vmIuk3fv/2wFxa9eurw00V9DsrtGYKfTpGfov659fvPJCPn7LfndLRbBD+iR6PUJ
         0/0ApB+JhqMDRa4IFM14eUdsufLIQcfO+UAkI0e7f+tojS3cwBNjK9EGTgv95xWe18pB
         9k4OesD5CPdluwRVESPSbvt93bb8Hi2fmN6BvhvvRCVuHKYdfhpHv01GmmPeQQvkJoUi
         arS6JicWLbBnhGyAVb3sxZ9l64KRUFKJx/dmS/I0lCBZkL/FIcAmFlcbsBCY2gR7ZGsp
         JwAghLBVroG6hfd+Rp4MhIjc2B0X45sT2dfEe4TQYedzxQ0aSXrt5qEoWv/FOHnUV4Pl
         nJYw==
X-Gm-Message-State: APuU4Z8rxZVDXgyMXtb5uEVdAi6Ik4UmNAkskFge3OPmsNA4bFbYCQJt
	5smhezEyTIxvtRLlt2dkF2bYrtmSo8GtIAeEk9cpxPQW3kTewZnwu0zQSQ9ZqQz+E9adtvVTnTK
	jcusU8RJQlpPvGVvmPN4FdG3ctsjgdRXrNmuzhWO+TTQ=
X-Gm-Gg: AYBFou2Ubzy7XA8YWO0SDHrj9C1LIhmX2bz9N66grLC9AzSRyuPOtxMhMkL2Wu2H6Rt
	utIRWDOBKiDWe18DuloKg2MepRv6cs0oFh73OABzDlfQfeVBRRHBJ1275gGDtk/UdmGryBXGfXJ
	eYZW5DRkYGpjC1gedJSxst93iraJapI97Mgk1cP0ogQZnNQMThZdGUk6mhB5zgF9Hqom3Un2Cl9
	VSpBB+dgmMkZ+KI9sHBZLAA06pIkgk6jOaCK/P4glYpw2jqDzTbU6t8/17+LupIWtr6NIRDoclR
	IEdTFSbDcpBrc7/SzYj28/reejmrJjZkrMlhwCcLGz+Lwm+GwfLQQtQ/tia6qQ1e2jMj3GJzjYt
	/2b4uMBSZU3salte+2AKsmZN9JtuQ2xgvnCtgyiRw+eSmV8176Lqxfftj61J/FVhjFhDLXEkTLj
	LSSoYE7UCaRzeZ2ZvXe2+dm2J+xBp64C452ibcYVFE8MEzpymv
X-Received: by 2002:a05:651c:a14e:b0:3a9:c840:10fb with SMTP id
 38308e7fff4ca-3ae2b423c94mr27234081fa.2.1794805715876; Sun, 15 Nov 2026
 21:08:35 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1794759652.git.zihanx@nebusec.ai> <8c46325c4a433f02fdc7241c0c3884126cb502af.1794759652.git.zihanx@nebusec.ai>
 <DMWD65CI6NZ6.2V1UCWL1FUM8K@gmail.com>
In-Reply-To: <DMWD65CI6NZ6.2V1UCWL1FUM8K@gmail.com>
From: zihan xi <zihanx@nebusec.ai>
Date: Mon, 16 Nov 2026 13:08:22 +0800
X-Gm-Features: AclHuK8wwX3X6c9X0CotsDoQlCsd788_-OkGc6Jo0WLhdVjqKCwpL8hPjkp3rg8
Message-ID: <CAANe3eSprp-ptkLStFXji38JQitsncoBBYSypRGJ2G5SMghMtg@mail.gmail.com>
Subject: Re: [PATCH net 1/2] udp: fix reuseport rescore fallback
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	bpf@vger.kernel.org, willemdebruijn.kernel@gmail.com, davem@davemloft.net, 
	edumazet@kernel.org, pabeni@redhat.com, horms@kernel.org, benh@amazon.com, 
	kuniyu@google.com, shuah@kernel.org, vega@nebusec.ai
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 12:51=E2=80=AFPM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Sun, Nov 15, 2026 at 07:55 PM Zihan Xi <zihanx@nebusec.ai> wrote:
> > When a reuseport group contains connected sockets, UDP lookup rescored =
the
> > socket selected by the reuseport program. If that socket did not match =
the
> > packet, lookup retained the stale selection while continuing the scan. =
This
> > could deliver a packet to a socket connected to a different peer.
>
> Not since 6.13, unless CONFIG_BASE_SMALL=3Dy.
>
> > Link: https://bugtracker.nebusec.ai/f/net/ipv6/udp.c||udp6_lib_lookup2|=
|socket-hijack||m7q
>
> That's not a hijack.
> udp_reuseport_add_sock() lets only sockets of one uid into a group.
> A member of the group attaches the prog.
> The prog picks a wrong socket of its own user.
>
> > +             if (need_rescore) {
> > +                     if (score > badness)
> > +                             badness =3D score;
> > +                     else
> > +                             result =3D sk;
> > +                     continue;
> > +             }
>
> This makes it worse.
> The unconnected sockets of a group have the same score.
> So the score of the picked socket is equal to badness, and the patch
> replaces the picked socket with sk.
>
> Sockets A, B, C are not connected. A is the first one in hslot2.
> has_conns is set:
>
>   reuseport picks   today   with the patch
>   ---------------   -----   --------------
>   A                 A       A
>   B                 B       A
>   C                 C       A
>
> Nack.
>
Thanks for the review. You are right on both points.

I missed the 4-tuple hash path added in 6.13, so this does not affect the
normal configuration there; the lookup2 path remains relevant with
CONFIG_BASE_SMALL=3Dy.

The proposed score > badness check also changes equal-score behavior
and can override a valid reuseport selection, as your example shows.
I will withdraw this patch and the security framing rather than send the
current series.

If I revisit the remaining CONFIG_BASE_SMALL behavior, I will first
preserve valid equal-score selections and test both the mismatch fallback
and equal-score reuseport cases.

This series is dropped

Thanks.

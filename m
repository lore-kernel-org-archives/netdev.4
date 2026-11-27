Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795776064;
	b=Hvv2nMDxohlqYqvq4D/atu6FDQL2//vKeK84BjtEZ/tI3Qv3IWvLmsFfbbJLtNOJQkoG
	 1rt1mrimbLnoUk1HVjN2L1w/jTEDkRM+QcIrkQi1HatG3RFD9+/IqnxKlL1uXfjR7lWKW
	 GSzxJfNhZ+mvl7zV8qc5rPwD9AyOkpIMStMb9REh3W20b0/H8QrLr/T/YhRyUfT6cUkOn
	 MbFsAaXmDEKFd6qq6PMvfNS1rshurVmCqRTt5/3icf4OkzK6P/FHUd8wtLukNn8GuXZ0L
	 Rs486L/3rblyb3RciPf1KKQhq3B1jZw2ILAQKYs1tTM97rCjNyx+fadJvabP0sENSdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795776064;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:In-Reply-To:References:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=46jt2PFBd8rULQ4Nt62VZapADm8oEY8BfGTGabREOUM=;
	b=QPKOqW/gD19xiMH4SYR5Uc+ebOUXZr6ArlDGHDhxKY2IDCu7y5ycBSkVxfPAe5lr6K1w
	 bE+MyP8o1rvkOQFywyvy/3KviIVqxR7biC0BDAW6qrSgZOfHucBjGZ/XkmfPJC85KVVwN
	 r3sy2POUtnIKmXqJtt/ayv1+IfASgyaUqDCA3l9Z7QPGw21QO20op4tBmpYcwQB4KJ7zC
	 5riv6jn7mll2uF5femUxN2eIlznarhCWVZGQfbgtbz/THuhmKDJox777uewpnzBZDiN0M
	 9MIv/PTx3CqdEJn412PjagH872xU1dubSClGkQj2RT5XneQ5X7DNFKnria87mToqJlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eDuPgHaR;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB08606A6AA
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 10:41:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DB08606A6AA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eDuPgHaR
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4a3e706b5dfso4994333f8f.2
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 02:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795776063; x=1796380863; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=46jt2PFBd8rULQ4Nt62VZapADm8oEY8BfGTGabREOUM=;
        b=eDuPgHaRC2KPGtaz+A22NSuvwSL5c0S2/zFOdQyD6aCjOhVgcuVtQjzSvQec+NBskO
         GFILsA7kxm2ho56P/w+E23h/xEs5Bem7Wa9d4t0P1GDu20HTExFjtSOd1tJGxqBAFBaO
         d3L+OTKO/C+IgE/s+bt2WgS1WLbycp27c+LeGecVVa44T/RJWT0vWgzhEgwHJS1d562p
         DGdJBkklROvvU8d8szblYMFAHpd/Wl1fSOK+1NkwhzPYY7haLhZraKOtRm5ar0keWauF
         k6LnC66mvpVU018A014jCvDM4f8SusXUeDf/IQwGlUpr/Oh9R/TlCUeFQdOt6gadcfak
         q22w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795776063; x=1796380863;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=46jt2PFBd8rULQ4Nt62VZapADm8oEY8BfGTGabREOUM=;
        b=K4Jouu1EoXi9SqRv9CS2JlGPYE4RxPfNgpsTtRPxlP0X2mG6PXZbazwxtmyNDpwFup
         C2tJbFNltz5elByXkzyheGA0Zb8offO9CwaMaLaDF9iq/sahUQxKxC6AgN30kn1wtgWB
         KaByJwoG1pRiObtq4NToD1+CJtT127k5flcpXp/3o5UVlkG/YlsRIzJGvucuNeA8cFMV
         ZPQ//7ae+futs+nGdjSW90AwkOu0Q9KFnBKsPaw1lX52lUetuBcVMqgwEGvgn8QYbPrZ
         wCXB+rd0fWv66yMG+OH3P9ne3P5T1++O/CJcnHDOZ5CD4NKgsV1rpuanlw9fWRu8kVUj
         PUrA==
X-Gm-Message-State: APuU4Z+F7JjkqMJuRqBwRF59Eby5aEPSpAaaWa2ODXZ64CtxitEx/Hlc
	vuDjpKEaws2hqoM5edCgzdWRff190OMJp/sWVu+HH5wACabO9ZXwa8hP
X-Gm-Gg: AZFdTZez4yLCeX+u4F/CHbwalIMa8u2HG4X1adUcrJkNO1nV8Pi6a7wSTeP7fQpZgg2
	dnop1D7t8y0bGAmFG2SpytQsNLBNClkGcQiVWAMPOAUUCvXRFj2fKnLbc6uPuu7u0ffMOrvmO2T
	S+59OMut8DyAXeg6dbExPqrUgOrUYUo1jY/tdN7Cm8c6Sn4YO8RmYWvyUZYGVeWKIFXaIFthdc6
	s8VPHhtfuBrR7Z8dClf2tynFb31MV6AaGQP5rSv6rKzrXfl/LSdC2gOkbgmd3UwlnBW9yQZUvTi
	Nbrla6tz/1vw96y0NkfteqZGvmvlnOHMki0hDDJG5KDM8snySeZfsAuRckicTP05kvmIHcN9Dcc
	2TKetIODPSS5JnQhFGC2XwFmAaSzZOFSQhPi2Nh9MD3Y8jleZLpekzAgqmNGKdsaWYFtVuKt4BK
	iDuyzsi8oqVNF3TKZMYMxFB24UQPv6SbAG3RAUfE+LD3aetUEGlABm/c0n/+pbIMXHIDiCtylNA
	Lo47yAUaGIzcvVfuCMDlnddKckeJBXU0rf5zDymgJ0o3gt+ZMifj87eD3AMBBsz59IEF/uRCmGo
	Bj0XI0ohkjrS8k5NFPb1In4/1BAK2Zc6qJvjDnZCztELEEOYJMXSrHUbDFfnNE7myA==
X-Received: by 2002:a05:6000:470c:b0:4a7:593a:f421 with SMTP id ffacd0b85a97d-4abb73b557amr44307973f8f.47.1795776062532;
        Fri, 27 Nov 2026 02:41:02 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b2c9sm47910577f8f.31.2026.11.27.02.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 02:41:02 -0800 (PST)
Date: Fri, 27 Nov 2026 10:41:00 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Xuanqiang Luo <xuanqiang.luo@linux.dev>
Cc: netdev@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Alexei
 Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, John
 Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi
 <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu
 <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa
 <jolsa@kernel.org>, Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai
 <ihor.solodrai@linux.dev>, Matthieu Baerts <matttbe@kernel.org>, Mat
 Martineau <martineau@kernel.org>, Geliang Tang <geliang@kernel.org>, David
 Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, Stanislav
 Fomichev <sdf@fomichev.me>, Neal Cardwell <ncardwell@google.com>, Kuniyuki
 Iwashima <kuniyu@google.com>, Pablo Neira Ayuso <pablo@netfilter.org>,
 Florian Westphal <fw@strlen.de>, Phil Sutter <phil@nwl.cc>,
 bpf@vger.kernel.org, linux-kernel@vger.kernel.org, mptcp@lists.linux.dev,
 netfilter-devel@vger.kernel.org, coreteam@netfilter.org, Xuanqiang Luo
 <luoxuanqiang@kylinos.cn>
Subject: Re: [PATCH net-next v1 0/6] net: avoid stack canaries in TCP/IPv4
 fast paths
Message-ID: <20261127104100.3c915088@pumpkin>
In-Reply-To: <bffee809-2992-40eb-97c7-72d919de0aed@linux.dev>
References: <20261124130631.1886963-1-xuanqiang.luo@linux.dev>
	<20261126102058.1fecf50f@pumpkin>
	<bffee809-2992-40eb-97c7-72d919de0aed@linux.dev>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
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

On Fri, 27 Nov 2026 15:33:15 +0900
Xuanqiang Luo <xuanqiang.luo@linux.dev> wrote:

> On 2026/11/26 at 19:20 David Laight wrote:
> > On Tue, 24 Nov 2026 22:06:25 +0900
> > Xuanqiang Luo <xuanqiang.luo@linux.dev> wrote:
> >   
> >> From: Xuanqiang Luo <luoxuanqiang@kylinos.cn>
> >>
> >> With CONFIG_STACKPROTECTOR_STRONG=y, a function that has a local array or
> >> passes the address of one of its locals to another function needs a stack
> >> canary. The canary is set up and checked on every call, also when the
> >> local is only used on a path that almost never runs.
> >>
> >> This series removes the canary from functions of the TCP/IPv4 fast paths,
> >> by returning results by value, by using storage that is not on the stack,
> >> or by not calling a function that has nothing to do.
> >>
> >> Patch 1 returns the two mptcp_space() values in a structure, so that
> >> __tcp_select_window() no longer needs a canary.  
> > 
> > While all (I think) architectures can return a big integer in two
> > registers (dx:ax on x86), not all ABI do the same for small structures.
> > For those architectures returning a struct by value is implemented by
> > passing the address of a hidden on stack structure.
> > So code generation may be worse than passing the values by reference.
> > I can't remember the list of architectures, mostly old ones - but not
> > 32bit x86 because the compiler option was set when regparm=3 was added
> > for 2.6.
> > (Note that this is different from passing small structures by value.)
> > 
> > David  
> 
> Hi David,
> 
> Good point! thanks for bringing that up.
> 
> The small-struct-by-value pattern in patches 1 and 4 follows the same
> approach Eric used in commit 7a4cd71fa451 ("net: add
> vlan_get_protocol_offset_inline() helper"), which returns a 2-field
> struct vlan_type_depth to avoid stack canaries in callers.
> 
> I did note the 8-byte struct ABI distinction you mentioned:
> - On the main 64-bit targets (x86_64, arm64, riscv64, ppc64le, loongarch64)
>    as well as 32-bit x86 (with -mregparm=3 / reg-struct-return), both
>    8-byte structs (struct mptcp_space_info and struct skb_coalesce_res) are
>    returned in registers and the stack canaries are dropped cleanly.
> - On ABIs that return structs (> 4 bytes on 32-bit ARM EABI, or any struct
>    on s390x) via a hidden stack buffer, it indeed falls back to a hidden
>    pointer. Even there, the callers previously passed *two* pointers to
>    locals (&space/&full_space in patch 1, &fragstolen/&delta_truesize in
>    patch 4), so passing one hidden 8-byte return slot should not be worse
>    than before, while keeping the code cleaner and type-safe.

There might be a subtle difference in the function itself.
I think the result structure gets allocated on stack and then a memcpy()
used to copy that to the caller's buffer during the function return.
That may, or may not, be faster.

> 
> That said, if maintainers prefer packing the two fields into a u64 so that
> even 32-bit ARM / s390x return them in registers, I'd be happy to change
> patches 1 and 4 to do that in v2.

That is horrid ... and you'd need to use a u128 on 64bit.
It really is a shame that C doesn't have a syntax for returning 2 integers
even though pretty much all ABI have always supported it.

	David

> 
> Thanks,
> Xuanqiang


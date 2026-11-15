Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794768944;
	b=kG4aLStmVCPWCQiWJOD5Tg9oS8fVprX3c5xsVcMLtYERx2JXEwr7Q6thHrPMgDznEm/E
	 R3vLQxqQHSpgwLSNXeO2A0lCc8/vCNaMcEPJCkOgq85TMR6UI2Pn6DBmrWsKVKummw3Py
	 5njlsH3CLW8FqAHOhONLp4b3DqmzVUT4L+OSh3AjFO1+7LnN92z5Pv0JthDOkmvVS3iqM
	 Nv8DX7LAnw0+BB/1fZZYt0b4PPFtQdL6AWvZn2NdaK5XpEEaFddnwd4P3vWPP9ZiclU9I
	 aNVLTDNaj5eqixiw5IaDNUjiPTqK/lpWJWu3DbvcflQgiwDNxmZzrmA+l/gqcBhDHdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794768944;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=IG32Kw+FYzaZBNXlxS/JC8X0bhotwNoaOWmAGONQUQI=;
	b=jS9SvviRODvg2JV5RlEwhr9juClZzT8ukNN5K83lUMUyHMkCEldIbJeKUWjGNCmbFoXJ
	 R3RdXtc8E0bhjAbZTLpsMQdEyUgIWPvQiRXu9hU/JwSshBeSr7SlbOTXjqU7XcD2o6ONJ
	 yzbTKioFT3BKltXNm7FC+7L1HcE5CCo2ekCLHRYQYe5GSrvA8NN/14vEZzUFqR7o59cR/
	 s6KT7ByToun1elgBxHOzC3a+6fmJqYwjzLQtC+n/nhktPbUGkvJBk+d6sVHqsURDGWV0w
	 gWR+1mUXqQg8J34740yDpoNqb99lzH8Fw51ZpbnyV1regcsdEkSfkzTvCOVGiRtetGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MaMcGUq4;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47E3606A31D
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 18:55:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E47E3606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MaMcGUq4
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so27182965e9.1
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 10:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794768942; x=1795373742; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IG32Kw+FYzaZBNXlxS/JC8X0bhotwNoaOWmAGONQUQI=;
        b=MaMcGUq4Di3BhMagDoIrYa7njPiZva5D44NDTDobuewxxQzxm58M1JurfblbElCQhy
         2FMGQ/a1Ye7lbqkBbJVeUGWACJP2K/0fkSVaq6W4htli4idNgFmLOh2MqKA5t3+18DDf
         gL30lht6Ps5jLUBRsplQ0FtUL07YgEsWWHM1PYGzXsDQ6o6g/zmxe1+6jcLMdhyneplL
         ATz6VqiYk/YtG8gscXcd+GSDdE2vjKtnvo+QdHUh42crPr6J226LRas0UtLTmM4wY1vj
         KSdx5GDxWYrgDuTPcsyxcwkzCZdxCFaELu9HgrlgtX4JZYqqWn1GE3AphsuYf3+1n1KZ
         Gc3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794768942; x=1795373742;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IG32Kw+FYzaZBNXlxS/JC8X0bhotwNoaOWmAGONQUQI=;
        b=RLR9R8hdrzAG0/bpltztaCEd1Va5U7Hz0onyLzuRI4M7JSQwfOw70mGbGfYyfD5C6X
         2jDJMX/D8fSsDBwGwOaudpi3cIGh7Finrb//cWNIInBYAS+2fRnxa397H6NdH+jyac23
         sBihwla5Hj16PfiGnU5dXlx0hiUVnVQ1QycA03NWYqOlHbJJnEtN+38XsG3P9F2KPBHH
         S4fsqEkEyjqPRsGjEz3HnYssqauIrelK3go8iggidFjPwUuvU1jsZTL1irRfjX6eb6UH
         evGNK3pxY2a4ElUoY4Kelpa9WEYp0RvWBLy4mo3YyZmBuw9Y3KVFYAO1+omVGIwqmyAM
         vZlA==
X-Forwarded-Encrypted: i=1; AL+hErHXMVqipc35nIFiZKd0Ztp07LmN8O8iHqxk+M6Awp6CaEWVi0UMCIhSACtF65B93Y2/8xKm+Fs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+gsNOJmIinpp13uNKo9ntD+ZUr68VJR/p893Hf77iqEvIWdGwe
	k141t8wIFMiiBWOgypJdapOw3XUnKiaww/6NTPsEgOWfKN/cuPCJsHoD
X-Gm-Gg: AYBFou0cQsU7JUVhfW0c7Ht87iVp5A8F/AVJCwMZ5Dgb36fPe01WkGtpkltCq0GOJeh
	469X4CCxSgx0HEMaE5gQggyurROjFiUp4KqJxsdKxR+Lce6X68BhfnGpGx5kF1JSDaQmzDA/T0f
	hqx4+pkv7TJDhEsMmzrIr6pow4eib5jCJHD8ZAHBjO9B+eaS+qwHpcydXWsTF31AJNfg2kgvo+n
	EsmJhBnNwIoxvrgqXCe7MbGHc7eKIhTQveik1M8ZdfImx3V1x907s4mW/k7cWD0zeidBIj96kkK
	88A9ezLafOR3OGjkse96ctJIxuKnYCYxu5qfOPcNhN17iH7/fCSt1WH72CLI4UrAfrzAiPGPK6A
	GHpg1FFrNvkY6jh9dsPLy5nyM9pDSGn9D3DSxUHO5r/ur8A8jjnu1GHegd/+lqAMvUvPanwDNgT
	1u2UG5AyLLH/enKb8WLTGCcsXNZjOhuXE0tfu3aC48X56Gy3N2OV72/RJqo1uR4PR+JI+VxPsl/
	ZcfW5PHIG6Qwn2fjdC2BYNa1yKDRC9sMIAswy7uHaplJYRV/1KYE1e9fwEkPwJoncAqqMQgXYad
	Gz9L9lrRZDRvpLpYANXCqsfjiQXG+O5C4x9pf24aFmQrEE+hRfFwF7eyyyAEQp55cg==
X-Received: by 2002:a05:600c:b86:b0:4a2:18c4:61a5 with SMTP id 5b1f17b1804b1-4bb55a61183mr189212495e9.6.1794768942083;
        Sun, 15 Nov 2026 10:55:42 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb571df488sm125695475e9.4.2026.11.15.10.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 10:55:41 -0800 (PST)
Date: Sun, 15 Nov 2026 18:55:39 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Demian Shulhan <demyansh@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jakub Kicinski
 <kuba@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Saeed Bishara
 <saeed.bishara.os@gmail.com>, Eric Biggers <ebiggers@kernel.org>, Ard
 Biesheuvel <ardb@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Andrew
 Morton <akpm@linux-foundation.org>, Marco Elver <elver@google.com>, David
 Gow <davidgow@google.com>, Brendan Higgins <brendan.higgins@linux.dev>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] arm64: csum: Add fused copy and Internet
 checksum
Message-ID: <20261115185539.41402600@pumpkin>
In-Reply-To: <CAOLeWCvsxDZyhYdSOz7hpSbc6x++2UuP4ZzUUagJWq1f+-ro8g@mail.gmail.com>
References: <20261114040943.219870-1-demyansh@gmail.com>
	<20261114040943.219870-2-demyansh@gmail.com>
	<20261114142631.7352b895@pumpkin>
	<CAOLeWCvsxDZyhYdSOz7hpSbc6x++2UuP4ZzUUagJWq1f+-ro8g@mail.gmail.com>
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

On Sun, 15 Nov 2026 19:25:24 +0200
Demian Shulhan <demyansh@gmail.com> wrote:

> Hi David,
> 
> > Is that right?
> > I thought ldp/stp required aligned addresses.
> > The code below is using get_unaligned().
> > I think the timings below are for ldp/stp?  
> 
> Unlike 32-bit ARM (ldrd/strd), AArch64 GPR ldp/stp support unaligned
> addresses in hardware on Normal memory. Both GCC 15 and Clang 21 merge
> the adjacent get_unaligned()/put_unaligned() pairs into ldp/stp, and
> the timings are from that code. Unaligned (src+1, dst+3) is only ~5%
> slower due to cache-line splits (~28.8-29.1 GB/s vs ~30.3-31.1 GB/s).

Ok, I knew there was a problem - but it is 32-bit only.

> > That is topping out at 10 bytes/clock.
> > Each loop iteration copies 32 bytes - so must take 3 clocks.
> > Which means it must be doing 16 byte read/write in a single clock.
> > So rather begs the question of why it is limited by the loop control
> > and checksum instructions rather than the memory accesses.
> > The checksum code needs 4 ALU instructions (for 16 bytes), if the CPU
> > can execute more than that then there is half a chance of getting the
> > loop down to 2 clocks.  
> 
> For 32 bytes, the loop is 16 instructions (4x ldp/stp, 8x adds/cinc,
> 2x add, cmp, b.ne). On Neoverse-V2 (6 ALU pipes, 8-wide dispatch) 12
> ALU/branch ops plus 4 paired memory ops put the floor right around ~3
> clocks/iteration (~5.2 IPC).

The floor would be nearer 2.
There are 11 ALU and a branch to fit in two clocks.

> > Just moving one (or both) the pointer updates into the middle may help.
> > Otherwise you try using negative offsets from the end of the buffer
> 
> Moving the pointer updates into the middle does help, it shaves up to
> ~5% off across sizes.

Thought it might - you were trying to do to many alu ops at the end.

> > and 'reg + reg' addressing (will need more pointers since I don't think
> > arm has 'reg + reg + offset' addressing. 
> For 'reg + reg', ldp/stp only support immediate offsets, so indexed
> addressing would force single-register ldr/str and double the memory
> instructions.

I didn't think that was possible.
x86 can do 'reg + reg + offset' but I have a feeling it ends up using
an alu u-op for one of the adds (on intel and/or amd). Nothing else
explains why we can't get move that 12 bytes/clock for ip cksum.

> 
> 
> > > + if (unlikely(len <= 0))
> > > + return 0;  
> >
> > Hmmm...
> > Does zero actually happen often enough for that to be a gain?
> > Even with the unlikely() it is likely to slow down the normal path.
> > And that assumes that the branch isn't mispredicted and that gcc
> > doesn't ignore the unlikely().  
> 
> len == 0 would fall through fine, but since len is a signed int in the
> csum_partial_copy_nocheck() prototype, this guards against negative len
> wrapping (unsigned int)len >> 5 (matching do_csum() right above it).
> Both compilers place the return 0 block out-of-line at the end of the
> function.

You've still got a branch that can (plausibly) get predicted taken.
 
> > > + sum2 += v0;
> > > + sum3 += v1;  
> >
> > Is using sum0/1 here actually slower?
> > My 'gut feel' is that it won't be - and saves the adds below.  
> 
> For 64-128B your gut feel is right - 2 accumulators is 2-10% faster from
> saving the post-loop fold, and on GCC 15 it matches 4 accumulators on
> larger buffers too (GCC folds v0 + v2 first, keeping a 1-cycle chain in
> 18 insns). The catch is Clang 21: with 2 accumulators it chains both
> adds/cinc updates onto the same accumulator and drops ~12% for >= 512B
> (27.0 vs 30.5-31.2 GB/s).

I hate that - why can't the compilers do what they are told :-)
gcc always compiles (a + b) + (c + d) as (((a + b) + c) + d) making
the register dependency chain (which matters far more then the number
of instructions) one clock longer.

Sometimes an OPTIMIZER_HIDE_VAR() can help - but it tends to add
a register-register move.

> > It is also worth checking that gcc doesn't zero extend v0 into a
> > register and then do a full 128bit add.
> > I'm sure I looked at the code using only 64bit variables for:
> > sum0 += v0;
> > carry0 += sum0 < v0;
> > both gcc and clang used 'add 0 with carry' for the second line.  
> 
> Checked - neither compiler zero-extends v0, both emit adds + cinc
> directly on the 64-bit registers.

This week :-)
clang tends to get it right, gcc has a habit of allocating a register
for the high part.
For u64 on 32bit (effectively the same) I've seen it spill constant
zeros to stack and do multiplies by registers that are zero. 

> 
> 
> > > + s += 32;
> > > + d += 32;
> > > + } while (--n);  
> >
> > It is a shame to have to update 3 variables here.
> > They may be taking the 3rd clock.  
> 
> Switching --n to an end pointer (s != end) and moving s += 32 / d += 32
> between the loads and stores drops the 3rd update on Clang (80 -> 76
> insns total) and cleans up GCC's loop setup (88 -> 81 insns), gaining
> +0.4% to +4.9% across sizes.
> 
> Here is the resulting 16-instruction loop with an end pointer and 4
> accumulators:
> 
>   GCC 15.2:                        Clang 21.1:
>     ldp  x10, x9, [x0]               ldp  x17, x18, [x0]
>     add  x11, x11, #0x20             ldp  x3, x4, [x0, #0x10]
>     ldp  x8, x7, [x0, #16]           add  x0, x0, #0x20
>     add  x0, x0, #0x20               adds x15, x15, x17
>     stp  x10, x9, [x11, #-32]        stp  x17, x18, [x1]
>     adds x3, x10, x3                 cinc x16, x16, hs
>     stp  x8, x7, [x11, #-16]         adds x13, x13, x18
>     cinc x12, x12, cs                stp  x3, x4, [x1, #0x10]
>     adds x4, x9, x4                  cinc x14, x14, hs
>     cinc x13, x13, cs                adds x8, x8, x3
>     adds x6, x8, x6                  add  x1, x1, #0x20
>     cinc x16, x16, cs                cinc x9, x9, hs
>     adds x5, x7, x5                  adds x10, x10, x4
>     cinc x15, x15, cs                cinc x11, x11, hs
>     cmp  x14, x0                     cmp  x0, x12
>     b.ne .Loop                       b.ne .Loop

Both those manage to get the ldp early (probably good)
but there are a lot of alu instructions at the end.
If moving the 's/d += 32' moved those instructions to before
the stp, then trying to persuade the compiler to move the
sum0/1/2/3 earlier might help as well.
I was thinking on the lines of:
	v0 = get_unaligned((const u64 *)s);
	v1 = get_unaligned((const u64 *)s + 8);
	sum0 += v0;
	sum1 += v1;
	put_unaligned(v0, (u64 *)d);
	put_unaligned(v1, (u64 *)d + 8);
	s += 32;
	d += 32;
	v0 = get_unaligned((const u64 *)s + 16 - 32);
	v1 = get_unaligned((const u64 *)s + 24 - 32);
	sum2 += v0;
	sum3 += v1;
	put_unaligned(v0, (u64 *)d + 16 - 32);
	put_unaligned(v1, (u64 *)d + 24 - 32);

but it might make things worse
(and the compiler might just ignore you).

I always try to do tests in userspace.
Makes it much quicker to see the effect of changes and you can
test just the inner part of the loop separately from the tail code.

As it stands this code it reasonably generic.
Although cpu without ldp/stp probably don't need the extra unroll.

David

> 
> I'll switch to the end-pointer loop with interleaved pointer updates in
> v3.
> 
> Thanks!
> Demian

Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794763538;
	b=Q+t9wULedsMBDVaYA3v99AoSxLhb+l68r/m+KOZ8Tkz1F5rq7gs1Jia50SjSu9SM3erH
	 qp70FvVsSi+f12uGtR/VYoYtQDL/+w+V8960+1vZvpKs+fnvFzzfLjRXaJqY9kL1Y3BNv
	 kWayN1Pum35w3gooHhljnkLwOO6Hk491rOMZh4o1/hqvHpsz9ffLIseJaHEssgHnbyEPb
	 tSnvxSYsdlEzsuIhcCu/HuFmid1VIZTaflhFCPUakGA8025ONBUMh7fNHODSvgCrSyvVb
	 KTEKlxiQUnPiFhkjJOxeDYdqsSjXKyyPyfTjHO74FfmoXJ1A3DR2NqhEAy+5fEbz71A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794763538;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=8/WPDpGmVdPIAzeL2O+AnOyyaH8bHrOc9fjg0qApgiw=;
	b=kTmKHiXN5hjNTjgOE1vWYzqa7i48/cIkLTqHZ2HMGxekalgT/f3HXZJPyAckPep4y9Ng
	 qp6NMcJx5+ptSpNzjtsWu6wjHDTCgqBEB8a4ewV1cdJvGCa/WqrWwkFJcw6raEX9ZQlM5
	 mYnCp6VkbqcTGPMB8vODoNmE+ojCM9CVtB6cts8akhkSWjyAvQVSBm1A4jZkyjPyUU1gJ
	 ZlpLslMmB5xd5bSG6SkN3jekJP0MR/B1843UmFIvHU5UuRLAB8/PaG/KR814tT8ggPu02
	 CN7A0TVjaku8P/cB1ZxZUqrMHbvNS9FSOp7e23ljnt96CoLc9w4uVzF2+qiAiOHCCDA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VkBViT6j;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB981606A323
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 17:25:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB981606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VkBViT6j
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1a2af4c8d00so5471069c88.0
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 09:25:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794763537; cv=none;
        d=google.com; s=arc-20260327;
        b=iFq/psomFUoNw4z6bd4W2D8Fy8cqSNU1tqWKStpRVQjqzC/pmWJOSSyUbmxg4GrBnI
         HlTPd0pDcMi7L4gKRc7p848JkmTLUWvWbKSnUeQsrLmYMfNWyuu9agMs3R1UtsoW1xe+
         eMuh8TB3NGutjoNt2Z4Mcbf3LqY77G91nChF1FM3Qmpq3hqe9vYwnb/lda8rY8R25mQI
         YDKphno0W+XWodocFQVHJ+4IPw+1dhMgwuwl7yaJX3EAcrpXryj3WM+D93bDhWlEnlsP
         jOVps1A3xzjy4FcX0/s5H2KrTuqKvaBXfxkMo6TlQyDDizpAY4xV3X9tcpjqOP2cCIe3
         155A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8/WPDpGmVdPIAzeL2O+AnOyyaH8bHrOc9fjg0qApgiw=;
        fh=1pGDJJObdu+uBUEwt7JS2RaBxGTy/NW76+3W4k4LegE=;
        b=ZMZZpUbTCtDHc7GoWueQPl1AhaHz6jGGwrRyBLzqZ9Nom+V0lSUaUDJlHfJ0KD67W/
         ZXWM5xxG5pyhAp6asr1SZu9zTKn+TxrnGqBayihZb38rDqnot3+1Gq7f/OwvzXs4jgAY
         gJD+JO3mj7mjqZSsDjJOZu2PBRaCAirk3INxsOzNu83GIIk0lzbwQ7C8T3i2jBpfewRL
         Ql1cGp7B9bQxz7QiCYQB+96hL+ismkhiWcY8Vwf1xy0oeU6l9AZ5WSr0W3lPlRiwAQkm
         plI0J9o2yzJqqu3/hOJAhwugf34Oufv+Pqk40eOhZTfRitSiSl6+XLpnmFufpdCIcXBw
         FDJA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794763537; x=1795368337; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8/WPDpGmVdPIAzeL2O+AnOyyaH8bHrOc9fjg0qApgiw=;
        b=VkBViT6jfN3H2Bo3+7OPCKtldapZ/DnlB8mQOYMbpeO5GoqqkgmWVk5x40Q4zebzmO
         FYwy/hAaNuewb8Un5EQDJ6WLauZaPmyKVti3Ew7rsUJBY8r2BIJg0FNJC1k6F6nYq75c
         LMqkISpA70LV5orfWObH5nwjrYVErKNRdUWqhvzzbkxxJX/kOLr0nTnx/VBh6M0Cz3PC
         k/OSPOtOSzOCy0+T0THv+N3fBfHYzDJKHjCQQGzbavXllRbHSpAc1iB73wFCH5LvyD/s
         iyE9sVuZInLAcI8nPnAft8r/ghFM99JN1fV8DRVAmsI2KI48L6iyNmgeTJS0CnxBTt1A
         jbqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794763537; x=1795368337;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8/WPDpGmVdPIAzeL2O+AnOyyaH8bHrOc9fjg0qApgiw=;
        b=m1cXFMXxDDO/+7cYJpo6wK4EszT+U587zgXnAbCEu70WukzG244yIvUY3I1z8UDEED
         yWzdQZfNnWuYrbr+BhKoxUwPH4ZouoWf53t3eLNzLNvqRc7qVlrDkLzwd1ntoOpY+0Qq
         NadPAZmMzb02mCjmu8RYjtLOW200S99mE3whY1jara9Iy7ypRQLBMWmwp4AwjAoc7oSN
         8Twqm/vDqBii3/qr7JS5gFWdZBiNYblopVmP+qN+VGnwcrcyxAinFV5VWuWNUo3SRkFy
         mkGozyjA3EWYN38o0l3J16qQ35eZx/Lw/QdJYPLkQ+5gvWOI8S3SFDmdyZWO3n8rkoZN
         FdKg==
X-Forwarded-Encrypted: i=1; AL+hErFhx+RkvHRwET/LRNexsEUmd9GUjWVLfLps1C564tdm45aIigav3k/aOJV6DiFSR+aEk1p2V3k=@vger.kernel.org
X-Gm-Message-State: APuU4Z+g3fVyw3nlpxenuEYZH8ccwr90abCk63E2TiwAiFE5MgEogthw
	Q5fY6y/lK6+LACChCk4O121tFPJplraCaZ7/zWfWvJGm2chS7322npm2JSNeZfKHVyAq0lRCv9Q
	4e9X69w/tWhLjuLu4FXOH3mNYOJYQ4ZE=
X-Gm-Gg: AYBFou3bVejGlFM+RfTf2pp1NIsAJhjx+l1TNkUNFL51HjT1DepAjK9x7NLM9UejshS
	/PirPBeBac+NT+DEEwapY+5BQgQ2YfO9Kdo5ODb4CKhahDBirgDcC234zDlEJea6hk4Y1j2oC4q
	cnTpNM9nAd47AabDpZpMn/dSqzdhqDcGMhStzf41fW9RYVC9dCi4MaEOc3YyXECPM31KjLUk1x5
	DqvXgsT50M06UQq8wZFS1Mv/Lk6IMIFrW9Nnd8Y5gat1R803Q8NH6FOtmHZ5Thqlr3igA9wosOY
	bhpsF9cQ2OLxQJ96CDqo7D26d8I9SxTGtyE9ivQJC2siiaDC9Sg1di0QdlYncc2QxMXnCjHZcB0
	OG46DDAVqj041cVNSzRRQgfTF0DU+pHwZUJi+aDajBraNPFqAHxk8Yyqjl61AnYTJdBkXZA==
X-Received: by 2002:a05:7022:5e09:b0:14d:baf5:c415 with SMTP id
 a92af1059eb24-1b5030e2edcmr7983031c88.7.1794763536707; Sun, 15 Nov 2026
 09:25:36 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114040943.219870-1-demyansh@gmail.com> <20261114040943.219870-2-demyansh@gmail.com>
 <20261114142631.7352b895@pumpkin>
In-Reply-To: <20261114142631.7352b895@pumpkin>
From: Demian Shulhan <demyansh@gmail.com>
Date: Sun, 15 Nov 2026 19:25:24 +0200
X-Gm-Features: AclHuK8qA33MUpKW3GT1d6dzApGg-4Pfax2Fna9VlXqhqHqjcGFwSDz-ktu1o7A
Message-ID: <CAOLeWCvsxDZyhYdSOz7hpSbc6x++2UuP4ZzUUagJWq1f+-ro8g@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: csum: Add fused copy and Internet checksum
To: David Laight <david.laight.linux@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Jakub Kicinski <kuba@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Saeed Bishara <saeed.bishara.os@gmail.com>, 
	Eric Biggers <ebiggers@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Marco Elver <elver@google.com>, David Gow <davidgow@google.com>, 
	Brendan Higgins <brendan.higgins@linux.dev>, linux-arm-kernel@lists.infradead.org, 
	netdev@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi David,

> Is that right?
> I thought ldp/stp required aligned addresses.
> The code below is using get_unaligned().
> I think the timings below are for ldp/stp?

Unlike 32-bit ARM (ldrd/strd), AArch64 GPR ldp/stp support unaligned
addresses in hardware on Normal memory. Both GCC 15 and Clang 21 merge
the adjacent get_unaligned()/put_unaligned() pairs into ldp/stp, and
the timings are from that code. Unaligned (src+1, dst+3) is only ~5%
slower due to cache-line splits (~28.8-29.1 GB/s vs ~30.3-31.1 GB/s).


> That is topping out at 10 bytes/clock.
> Each loop iteration copies 32 bytes - so must take 3 clocks.
> Which means it must be doing 16 byte read/write in a single clock.
> So rather begs the question of why it is limited by the loop control
> and checksum instructions rather than the memory accesses.
> The checksum code needs 4 ALU instructions (for 16 bytes), if the CPU
> can execute more than that then there is half a chance of getting the
> loop down to 2 clocks.

For 32 bytes, the loop is 16 instructions (4x ldp/stp, 8x adds/cinc,
2x add, cmp, b.ne). On Neoverse-V2 (6 ALU pipes, 8-wide dispatch) 12
ALU/branch ops plus 4 paired memory ops put the floor right around ~3
clocks/iteration (~5.2 IPC).


> Just moving one (or both) the pointer updates into the middle may help.
> Otherwise you try using negative offsets from the end of the buffer
> and 'reg + reg' addressing (will need more pointers since I don't think
> arm has 'reg + reg + offset' addressing.

Moving the pointer updates into the middle does help, it shaves up to
~5% off across sizes.

For 'reg + reg', ldp/stp only support immediate offsets, so indexed
addressing would force single-register ldr/str and double the memory
instructions.


> > + if (unlikely(len <=3D 0))
> > + return 0;
>
> Hmmm...
> Does zero actually happen often enough for that to be a gain?
> Even with the unlikely() it is likely to slow down the normal path.
> And that assumes that the branch isn't mispredicted and that gcc
> doesn't ignore the unlikely().

len =3D=3D 0 would fall through fine, but since len is a signed int in the
csum_partial_copy_nocheck() prototype, this guards against negative len
wrapping (unsigned int)len >> 5 (matching do_csum() right above it).
Both compilers place the return 0 block out-of-line at the end of the
function.


> > + sum2 +=3D v0;
> > + sum3 +=3D v1;
>
> Is using sum0/1 here actually slower?
> My 'gut feel' is that it won't be - and saves the adds below.

For 64-128B your gut feel is right - 2 accumulators is 2-10% faster from
saving the post-loop fold, and on GCC 15 it matches 4 accumulators on
larger buffers too (GCC folds v0 + v2 first, keeping a 1-cycle chain in
18 insns). The catch is Clang 21: with 2 accumulators it chains both
adds/cinc updates onto the same accumulator and drops ~12% for >=3D 512B
(27.0 vs 30.5-31.2 GB/s).


> It is also worth checking that gcc doesn't zero extend v0 into a
> register and then do a full 128bit add.
> I'm sure I looked at the code using only 64bit variables for:
> sum0 +=3D v0;
> carry0 +=3D sum0 < v0;
> both gcc and clang used 'add 0 with carry' for the second line.

Checked - neither compiler zero-extends v0, both emit adds + cinc
directly on the 64-bit registers.


> > + s +=3D 32;
> > + d +=3D 32;
> > + } while (--n);
>
> It is a shame to have to update 3 variables here.
> They may be taking the 3rd clock.

Switching --n to an end pointer (s !=3D end) and moving s +=3D 32 / d +=3D =
32
between the loads and stores drops the 3rd update on Clang (80 -> 76
insns total) and cleans up GCC's loop setup (88 -> 81 insns), gaining
+0.4% to +4.9% across sizes.

Here is the resulting 16-instruction loop with an end pointer and 4
accumulators:

  GCC 15.2:                        Clang 21.1:
    ldp  x10, x9, [x0]               ldp  x17, x18, [x0]
    add  x11, x11, #0x20             ldp  x3, x4, [x0, #0x10]
    ldp  x8, x7, [x0, #16]           add  x0, x0, #0x20
    add  x0, x0, #0x20               adds x15, x15, x17
    stp  x10, x9, [x11, #-32]        stp  x17, x18, [x1]
    adds x3, x10, x3                 cinc x16, x16, hs
    stp  x8, x7, [x11, #-16]         adds x13, x13, x18
    cinc x12, x12, cs                stp  x3, x4, [x1, #0x10]
    adds x4, x9, x4                  cinc x14, x14, hs
    cinc x13, x13, cs                adds x8, x8, x3
    adds x6, x8, x6                  add  x1, x1, #0x20
    cinc x16, x16, cs                cinc x9, x9, hs
    adds x5, x7, x5                  adds x10, x10, x4
    cinc x15, x15, cs                cinc x11, x11, hs
    cmp  x14, x0                     cmp  x0, x12
    b.ne .Loop                       b.ne .Loop

I'll switch to the end-pointer loop with interleaved pointer updates in
v3.

Thanks!
Demian

=D1=81=D0=B1, 14 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 16:2=
6 David Laight <david.laight.linux@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sat, 14 Nov 2026 03:57:00 +0000
> Demian Shulhan <demyansh@gmail.com> wrote:
>
> > arm64 currently falls back to the generic csum_partial_copy_nocheck() i=
n
> > lib/checksum.c, which performs memcpy() followed by a second pass in
> > csum_partial(). This double pass is hit on software GSO paths
> > (skb_segment() without SG or TX checksum offload, e.g. TCP over
> > WireGuard) and UDP/ICMP replies.
> >
> > Implement a single-pass csum_partial_copy_nocheck() in
> > arch/arm64/lib/csum.c using four independent __uint128_t accumulators
> > over a 32-byte stride, followed by 16/8/4/2/1-byte tail handling. Each
> > word is read once into a GPR before storing and summing, emitting paire=
d
> > ldp/stp and adds/cinc carry propagation with no stack frame.
>
> Is that right?
> I thought ldp/stp required aligned addresses.
> The code below is using get_unaligned().
> I think the timings below are for ldp/stp?
>
> >
> > Throughput on ARM Neoverse-V2 (Google Axion, 3.0 GHz, GCC 15.2 -O2,
> > warm L1 cache):
> >
> >    len   memcpy + do_csum   csum_partial_copy_nocheck   speedup
> >   ----   ----------------   -------------------------   -------
> >     64         10245 MB/s                  15902 MB/s    +55.2%
> >    256         18851 MB/s                  26026 MB/s    +38.1%
> >    512         22465 MB/s                  28421 MB/s    +26.5%
> >   1024         24330 MB/s                  29900 MB/s    +22.9%
> >   1368         24192 MB/s                  30221 MB/s    +24.9%
> >   1448         24188 MB/s                  30279 MB/s    +25.2%
> >   1500         24165 MB/s                  30096 MB/s    +24.5%
> >   4096         25299 MB/s                  29946 MB/s    +18.4%
>
> That is topping out at 10 bytes/clock.
> Each loop iteration copies 32 bytes - so must take 3 clocks.
> Which means it must be doing 16 byte read/write in a single clock.
> So rather begs the question of why it is limited by the loop control
> and checksum instructions rather than the memory accesses.
> The checksum code needs 4 ALU instructions (for 16 bytes), if the CPU
> can execute more than that then there is half a chance of getting the
> loop down to 2 clocks.
> Just moving one (or both) the pointer updates into the middle may help.
> Otherwise you try using negative offsets from the end of the buffer
> and 'reg + reg' addressing (will need more pointers since I don't think
> arm has 'reg + reg + offset' addressing.
>
> >
> > Suggested-by: David Laight <david.laight.linux@gmail.com>
> > Signed-off-by: Demian Shulhan <demyansh@gmail.com>
> > ---
> >  arch/arm64/include/asm/checksum.h |   3 +
> >  arch/arm64/lib/csum.c             | 100 ++++++++++++++++++++++++++++++
> >  2 files changed, 103 insertions(+)
> >
> > diff --git a/arch/arm64/include/asm/checksum.h b/arch/arm64/include/asm=
/checksum.h
> > index dc52b733675d..9f766db01152 100644
> > --- a/arch/arm64/include/asm/checksum.h
> > +++ b/arch/arm64/include/asm/checksum.h
> > @@ -44,6 +44,9 @@ static inline __sum16 ip_fast_csum(const void *iph, u=
nsigned int ihl)
> >  extern unsigned int do_csum(const unsigned char *buff, int len);
> >  #define do_csum do_csum
> >
> > +#define _HAVE_ARCH_CSUM_AND_COPY
> > +__wsum csum_partial_copy_nocheck(const void *src, void *dst, int len);
> > +
> >  #include <asm-generic/checksum.h>
> >
> >  #endif       /* __ASM_CHECKSUM_H */
> > diff --git a/arch/arm64/lib/csum.c b/arch/arm64/lib/csum.c
> > index 75db718e5b6a..a9617cde28c1 100644
> > --- a/arch/arm64/lib/csum.c
> > +++ b/arch/arm64/lib/csum.c
> > @@ -2,8 +2,10 @@
> >  // Copyright (C) 2019-2020 Arm Ltd.
> >
> >  #include <linux/compiler.h>
> > +#include <linux/export.h>
> >  #include <linux/kasan-checks.h>
> >  #include <linux/kernel.h>
> > +#include <linux/unaligned.h>
> >
> >  #include <net/checksum.h>
> >
> > @@ -116,6 +118,104 @@ unsigned int __no_sanitize_address do_csum(const =
unsigned char *buff, int len)
> >       return sum >> 16;
> >  }
> >
> > +static __always_inline __wsum csum_fold128(__uint128_t sum)
> > +{
> > +     u64 s;
> > +
> > +     sum +=3D (sum >> 64) | (sum << 64);
> > +     s =3D sum >> 64;
> > +     s +=3D (s >> 32) | (s << 32);
> > +     return (__force __wsum)(u32)(s >> 32);
> > +}
> > +
> > +/*
> > + * Single-pass copy and ones' complement sum. Each word is read once i=
nto a
> > + * GPR before storing and summing, so the returned sum always matches =
@dst
> > + * even if @src is concurrently modified.
> > + */
> > +__wsum csum_partial_copy_nocheck(const void *src, void *dst, int len)
> > +{
> > +     const u8 *s =3D src;
> > +     u8 *d =3D dst;
> > +     __uint128_t sum0 =3D 0, sum1 =3D 0, sum2 =3D 0, sum3 =3D 0;
> > +     unsigned int n;
> > +
> > +     if (unlikely(len <=3D 0))
> > +             return 0;
>
> Hmmm...
> Does zero actually happen often enough for that to be a gain?
> Even with the unlikely() it is likely to slow down the normal path.
> And that assumes that the branch isn't mispredicted and that gcc
> doesn't ignore the unlikely().
>
> > +
> > +     n =3D (unsigned int)len >> 5;
> > +     if (n) {
> > +             do {
> > +                     u64 v0, v1;
> > +
> > +                     v0 =3D get_unaligned((const u64 *)s);
> > +                     v1 =3D get_unaligned((const u64 *)(s + 8));
> > +                     put_unaligned(v0, (u64 *)d);
> > +                     put_unaligned(v1, (u64 *)(d + 8));
> > +                     sum0 +=3D v0;
> > +                     sum1 +=3D v1;
> > +
> > +                     v0 =3D get_unaligned((const u64 *)(s + 16));
> > +                     v1 =3D get_unaligned((const u64 *)(s + 24));
> > +                     put_unaligned(v0, (u64 *)(d + 16));
> > +                     put_unaligned(v1, (u64 *)(d + 24));
> > +                     sum2 +=3D v0;
> > +                     sum3 +=3D v1;
>
> Is using sum0/1 here actually slower?
> My 'gut feel' is that it won't be - and saves the adds below.
>
> It is also worth checking that gcc doesn't zero extend v0 into a
> register and then do a full 128bit add.
> I'm sure I looked at the code using only 64bit variables for:
>                         sum0 +=3D v0;
>                         carry0 +=3D sum0 < v0;
> both gcc and clang used 'add 0 with carry' for the second line.
>
> > +
> > +                     s +=3D 32;
> > +                     d +=3D 32;
> > +             } while (--n);
>
> It is a shame to have to update 3 variables here.
> They may be taking the 3rd clock.
>
> David
>
>
> > +
> > +             sum0 +=3D sum2;
> > +             sum1 +=3D sum3;
> > +     }
> > +
> > +     if (len & 16) {
> > +             u64 v0 =3D get_unaligned((const u64 *)s);
> > +             u64 v1 =3D get_unaligned((const u64 *)(s + 8));
> > +
> > +             put_unaligned(v0, (u64 *)d);
> > +             put_unaligned(v1, (u64 *)(d + 8));
> > +             sum0 +=3D v0;
> > +             sum1 +=3D v1;
> > +             s +=3D 16;
> > +             d +=3D 16;
> > +     }
> > +     if (len & 8) {
> > +             u64 v =3D get_unaligned((const u64 *)s);
> > +
> > +             put_unaligned(v, (u64 *)d);
> > +             sum0 +=3D v;
> > +             s +=3D 8;
> > +             d +=3D 8;
> > +     }
> > +     if (len & 4) {
> > +             u32 v =3D get_unaligned((const u32 *)s);
> > +
> > +             put_unaligned(v, (u32 *)d);
> > +             sum1 +=3D v;
> > +             s +=3D 4;
> > +             d +=3D 4;
> > +     }
> > +     if (len & 2) {
> > +             u16 v =3D get_unaligned((const u16 *)s);
> > +
> > +             put_unaligned(v, (u16 *)d);
> > +             sum0 +=3D v;
> > +             s +=3D 2;
> > +             d +=3D 2;
> > +     }
> > +     if (len & 1) {
> > +             u8 v =3D *s;
> > +
> > +             *d =3D v;
> > +             sum1 +=3D v;
> > +     }
> > +
> > +     return csum_fold128(sum0 + sum1);
> > +}
> > +EXPORT_SYMBOL(csum_partial_copy_nocheck);
> > +
> >  __sum16 csum_ipv6_magic(const struct in6_addr *saddr,
> >                       const struct in6_addr *daddr,
> >                       __u32 len, __u8 proto, __wsum csum)
>

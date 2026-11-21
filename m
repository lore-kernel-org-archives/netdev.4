Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795273406;
	b=5Rsh2FYgkychSfUItmrjMcVl6cihctXFAH9/WN2wDse7OOsyJaORQk7LJZYvTHJw9y1d
	 BD26uwWkYOnUYvvZ4S4FC7bcwIuIPuZvrOJwa4DU8+ZNo10YHCgSQyicYSGoHPhhHNheL
	 RTuXCgQEAiYtB/Qb9o+gOkEYbWjQHku99Q4PuC/MnSExydrzi5ueR9zwZFah11AV81kEI
	 doeQfM/q4y7baIQg6NcaqXI3ppisWD3VRyVazS3IKxBNjTN5gXDPCv5M6oGRUw6Mfm2E2
	 3PqzKRTLqiO/EjFJGMmxXNKom04wlmBj0DJWZ8jxGVseQh1HjCS+2OAEz5BDKIy+5Yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795273406;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=vbgwELF6CWUmH82cJRM4qpAueUKNM+gZeKyQBoi7/Ao=;
	b=y/gk1oQdFAf4CiOo+JcHke6jSj4tzQ6rqjHs50sPh0v98H5bAPbwEOAvobicAGW9EIX/
	 T2b6FRT/b7oFz7WK5t9OihNuNmjZ1qdwg8ZZdhntJLK9vYKs6i6dTZZt8w7xtz1TYvJIf
	 U6hmTJ5f3OCDL9a/Marcv2kFMXZhcoCre0QOV8TPbrEVw8aQKztE5Dvf7V+jrAqH1/6RM
	 G5LeAVManLvpMQs/Sv/gBsshkS0imNMIhd6sY8HRTAB53GDtz95P8qJUbXiKniCyvuhsK
	 /m5ksYQlw4EJ/8MPnvFRPagFDtu9/cvzFz6QK9895cX30fVN2sAOQVPl3DP5Zc6B/IA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LBAsM7jS;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CAB6606A32C
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 15:03:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CAB6606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LBAsM7jS
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36a315ed211so2244631eec.0
        for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 07:03:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795273405; x=1795878205; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vbgwELF6CWUmH82cJRM4qpAueUKNM+gZeKyQBoi7/Ao=;
        b=LBAsM7jSYWfSfmrtLHBJv15IzqQYPWUWMHug0FNaBpPZqN0pAl/cv2Xa1iZQKzc3vZ
         qOJGiuL1Go+1gKj6qMyp/idKPUsdAh1xnznL9i/cv6ofDIHkMyJm5cSD5Gr16UjmWB1y
         nv2vjhHAE8NnzeheikRTAKilYTbm7pyoandVysh4QuUejYxHVYcFj0qAZfEXSpVutg5o
         ZsB0SNWdA5smO/zY4yMgSELziKuTYXOzGu2/rGhC3YMHkTEBJ6t+dXe6xF1ir8MNX3pr
         m4Azm0Xgk1gJpfNjulvGPOcI+4Ac7mO0Li2l4CxRIFA9/f8MpWysV2EixgBeGIyUD6uA
         ze8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795273405; x=1795878205;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vbgwELF6CWUmH82cJRM4qpAueUKNM+gZeKyQBoi7/Ao=;
        b=EQMvTKcHhBH+3CvzPTm1Rfn0ZhX32sdnJqgDmdwZSIJZXtfRAa7OYhahJmkJ20zJlp
         e00fSinzlbE4emLFVPtCmGciBLv45H3QVCRmTvyjM+g9ukrBbHa/pX7+AUtdpRVhAz2k
         BJQz8pFz9Bq550eBsHZ7jmoonSW1Ud97/CIYbyEtFXs52pjMC9VtrrlhjEEsD39B2vtK
         SAjvOfFReKBnrwiBgSkk5YM6DmdFydMBBw+5dmJxDb/SI1wl6xJRslihzgZ08FTjjvyM
         M9kHaA9k3I12Nz9pR1oYd9MksMXwFMIeawNriTYwRHPoe5fWoCmSwuGtk3teU9va2Rjr
         YZKg==
X-Forwarded-Encrypted: i=1; AL+hErH8Ce1gip/bEwKTJoIGMwMLoUBmulToJ4tyIIq5RGOYqRIAKR0PatWWFf3oqBtJxhRKIqMvoSU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+S36ORfvvhVXBJLHDn2LEYQO4O2Y/sOViA/lugAaZ9Io79GLd5
	8Hnn04Llg0j+QUCO0L1nPTY/nT5NPlTo/gT86sPUwVLfuSsv/Wbw2HJm0mtKwr90
X-Gm-Gg: AZFdTZdppWu3iqSOciOXSJMwywXVBIb3/cVNmpf568tKmpYfiA9yUknn/LYxDRdvOpw
	OJ0ZT0QzUHtDEffp53MHolIwSkoVVqhyJwq9D8gWYbbGNlVgI7iFJGsgzvnNstfxxN+fZvD8DNh
	igU9PTPofzgOK05qJZqzoVg2a4k1lhe7tgiCSjxXPbmgFSPD5ACSXtezwpbqQ1jTLvgAm55vjF8
	O+iBsieeUjOFxGj6l8zRhyvmiHQN28LEr7UX+l1TJla+ik2OhqhyScLAT2mB5JAii/YPUzl1+X7
	yOjWpZNmHRhvD7/1KpalzgY9Qxt7LbwX4nCAVLy7oWvQkeIdy0gIXFdhpgKBkaXqfi+LrNs1SYy
	YAfokqhSv1LOXPUfallbq5qcUZWILbo0R55UXgac/3z9iYug1BLMsWxEh0hxd+SEp8CJDwgXHE1
	/DGlpqSgP4OBORNPbqhECLfyS+u11ajbo5K9QVgsxYiFaEiwcl8iwj65qcoSUwPT3R6eM+h++Oe
	lROQijC1it2rXF1vBRZrrzeAg1vMt5V7fBjasJIvkQC8hj4ak1yt29zpeXhrppZkQ8uPPiVkXoG
	+VojPxdWvQP4i1Sv2Jni/1sQ0w==
X-Received: by 2002:a05:7301:5098:b0:381:5fe2:a079 with SMTP id 5a478bee46e88-3856c6b010amr6448576eec.1.1795273405079;
        Sat, 21 Nov 2026 07:03:25 -0800 (PST)
Received: from [127.0.1.1] ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7fc3sm16396954eec.8.2026.11.21.07.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 07:03:24 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Alexander Lobakin <aleksander.lobakin@intel.com>, Aleksandr Loktionov <aleksandr.loktionov@intel.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, Bart Van Assche <bvanassche@acm.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, intel-wired-lan@lists.osuosl.org
Subject: Re: [PATCH v2] docs: kdoc: fix struct_group_tagged() parsing regression
Date: Sat, 21 Nov 2026 15:03:21 +0000
Message-ID: <179527340172.2367332.3292077208678045371@gmail.com>
In-Reply-To: <20260916214357.22573-1-emmaonana18@gmail.com>
References: <20260916214357.22573-1-emmaonana18@gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: kpatch-send.py

Hi Onana,

Thanks for the patch, and sorry it took me this long to test it. Randy
tested v1 and carried his Tested-by and Acked-by to v2 in September; the
run below is independent, on mainline d0f871bfb831 (2026-11-20).

Short version: with a fuzz-2 apply the warnings in the four headers below
go away and the test suite has no new failures. The patch needs a rebase
before it can go in. Two things below are worth a look -- the rendering
loss and the excess-warning scope -- but I do not think either has to hold
up that rebase; that is for you and the maintainers to decide.

git apply rejects the hunks in tools/lib/python/kdoc/xforms_lists.py and
tools/unittests/test_kdoc_parser.py, because of 2d72a4c09867 ("docs:
kdoc: parse context_lock_struct() as struct declaration"), which landed
after v2. The kdoc_parser.py hunk still applies. With patch -p1 those two
go in at fuzz 2. Everything below is from that tree.

Could you rebase onto current mainline and post a v3? For v3 I am only
asking for the rebase; the rendering follow-up and the excess-warning
question below are for later.

kernel-doc -Wall, warning lines (the tool prints each of these twice, so
4 -> 0 is two warnings):

  include/net/page_pool/types.h                   4 -> 0
  include/net/libeth/rx.h                         2 -> 0
  include/net/libeth/xsk.h                        2 -> 0
  drivers/net/ethernet/intel/ice/devlink/health.h 2 -> 0

Those four files are also where the descriptions disappear. The five
warnings above are about the group names themselves; with the
xforms_lists.py hunk alone kernel-doc instead flags the 24 field
descriptions as excess, and the endswith() hunk keeps them out of that
count.

Unit tests (cd tools && /usr/bin/python3 unittests/run.py): 122 -> 123
tests; with only the test hunk the new case is the only failure beyond the
four expected ones, and with the two code hunks as well there are no new
failures.

Those results -- kernel-doc -Wall on the four headers and the unit tests,
no make htmldocs -- are what the Tested-by below covers. If the v3 hunks
come out the same as in v2 -- same added and removed lines, only offsets
and context differing -- and no other commit has touched
tools/lib/python/kdoc/, tools/unittests/ or those four headers since
d0f871bfb831, feel free to add it; if in doubt, drop it and I will re-test
and reply with a new tag.

The rendering follow-up: with v2 the field descriptions inside these
groups stop being rendered. page_pool_params renders today as
{unnamed_struct} twice plus its eleven field descriptions; with v2 it
renders the group names fast and slow, and the eleven field descriptions
are gone from kernel-doc's output. Across the four headers that is 24
descriptions, and no other file's rendered output changes -- I checked
every file that uses struct_group_tagged. They come back if those comments are
rewritten as @fast.order:, @slow.netdev: and so on, which needs the
xforms_lists.py change in this patch. I will send that rewrite as a
second patch.

The excess-warning question: the endswith() check in kdoc_parser.py also
silences excess-member warnings where a comment uses the flat name for a
nested member instead of the dotted one, in files that use no struct_group
at all -- for example 12 warning lines to 0 in include/linux/msi.h, 24 to
0 in include/linux/mroute_base.h, 20 to 0 in include/net/macsec.h and 30
to 0 in drivers/gpu/drm/panthor/panthor_device.h. Each of those is printed
twice. msi.h has no other warnings, so it goes quiet entirely; the other
three keep their unrelated ones. In msi.h, mroute_base.h, macsec.h and
panthor_device.h the rendered text does not change at all; only the excess
warnings go away. If that is wider than you intend,
restricting the check to members of a struct_group_tagged() group should
keep those warnings; I have not tried that, and the parsed members do not
record where they came from today.

The testing above was run by an AI assistant (Hermes Agent) under my
direction, and this message was drafted with it; I checked every number,
edited the text, and the tag below is mine.

Tested-by: TAKANO Mitsuhiro <takano32@gmail.com>


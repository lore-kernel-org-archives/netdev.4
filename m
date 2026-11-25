Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795614906;
	b=W6nrSd4znSaPqddIoyyKu/wZfJ6Scw7+CmT90baQBt5SQ/mpp0BeElv7EbPlIBcsdLZl
	 F6weRECATcJZXEXU8jfUj87o+TTnXt8kGlRWH1RV4qwfJRFuM3QH3jKBrV6MJojbrP+XS
	 RNtay78WWwiXO3UHrDiV8EEUhgFKMK10SwTNBe31fewnlhtjXGuQUsKDLGoJ6QPmzvsub
	 PRFuxjyqPzqi1XM1/AAaE3FTgVf32f6yRztNtNjiqox5cqHvW3TNYB8x4EPzQxT+iL9PP
	 HwaaOR3mxLcNBk356ZoZI4oteAay2M1YOnFxRZ4Wpbyx6IypsVaERV77wrRvExnilGA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795614906;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=MYdSWZX6z3J81MBEprutofG6iM+0DzbiUdKjQNRWO2E=;
	b=Apx6C1NMMxKn+myTAyBE5jtOM987yTjJPZNHJ5kBJRSNv3ypbU8tnUsYmS0n5ZtRb2tn
	 xK4eyEUc667FCRXYDsSSXU3sbiCLzK3JImIYyy4bwuToI9m1YLVsNteKvCvR4aBFBQPNJ
	 14mGsPQS0xDqzCY0djSkiHZRUEiY2MgQ8f2R0JbWa7NI1mUnZd+5SA9KCNej1AM+8nbdA
	 2gFydXrFRkMA0aZXyas7R8Emy3xDwPh+vUATvqCzAPq13Cm7FEjW1iUEAYDqRMZQmjxzS
	 VJJNB7pvN9BtdMlmo1eD+UkxIvSxsRfV5ALKDwOR8hpOoWncAlJUAZcUbLWmNqzOycg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=STitpKql;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FA5606A31E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 13:55:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04FA5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=STitpKql
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b4bd3d98bfso7379052a12.1
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 05:55:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795614904; cv=none;
        d=google.com; s=arc-20260327;
        b=rTNDHk7FVu11OSZC8J7vKEHcRqX5AxQc2LyB9wIGZy7cVMgqjTHmlInE/0IE1EhOug
         0CnSaCflUeaZbwVeWzhDjLijDQhBldWYTh9P4tHvFkdNcR6p8Yrn+fq/2wrj36WQStxG
         Wc10TQRaS/Q7mNrRmGy9/2O4LYmNv/KSPLh2KjbXbBgU7Y0B1yRagz/+N6Dm24aUyLav
         ijJIOMPeKmNsWQPIy9MWwQ/WrIjT0jpdKX4hkZbREC8dfgocxu+bpXnvPly+rG7fRXM9
         LRDcGs5EbCRSXrmb9FmQmyZqU+nMTwMpejm6MlL65HrOkPpw2VbUupoi2jo8dHsjYNYm
         CuTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MYdSWZX6z3J81MBEprutofG6iM+0DzbiUdKjQNRWO2E=;
        fh=h0j2m7bByx8YFzoqSJ1Bmww4aMy/ouaZN1Zcm0xYYJ0=;
        b=EWppv3UB+9WB45VZML9HY9Ox/aruln3I8TNmQYBvCyxmrwh42lhLFz/ETbMRHFz4jW
         iCCYanjbbuOB5mFjcykacpC6VCEIRJebr2lDCX69YxmoqHIgLE1USn0L2SYMK+ya9W2K
         c1mpRQoIgb7jUdS70NBYt68+A9dyqvoy3ivVrwnSbuAvf3JLiA2ZYRQVsvkWjSCt7+K+
         m+tubHyvXlDA1kedM3670NHmbfXk+EUkhPp73mn9cQGB1T1tXEkLcuJUztaxYy8vbxVF
         LHFAc9S1ZZNNJ2lFyI8kSlqCo2j1yyiDuBAtR6qq1FZYJZ6C0a+rrPM0Y+GrN1y3BDbQ
         TH0Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795614904; x=1796219704; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MYdSWZX6z3J81MBEprutofG6iM+0DzbiUdKjQNRWO2E=;
        b=STitpKql3+gSxRBbZFO+mxFfLYg6flkY9vu99KQo50PFn2zLcFCifP7FqvDrKVRYUX
         Ob+OefPHjb6KLCfeEYwK/dJEwpH++JpvoCioEKQ3TKLiZMz5crHri8CCeKjoviXZBBJp
         UY2AgAhzSb5NgUD4onubHisj+TQHlxLJsSnxkuQzR8FBzYIoI4OUqLqx57ms83XPoN/T
         icfPDHLSlGlRXIc+sRVpBUb7qd/UDh1UbNtHCNArhZZd3pMCAKroEyr6UDjscBnaakVY
         82FK4/JI3h8vxO8RsB2ADg6P4TWmlv4YqsAJ+HVV6GwGuGOhvPE6H+GFLAK4yWARRIgQ
         clYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795614904; x=1796219704;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MYdSWZX6z3J81MBEprutofG6iM+0DzbiUdKjQNRWO2E=;
        b=r5q8P1l18OtPgdvGcI8DW51hnwtSWtVzCZkO+L3Mftx7P19OBRVNGkl1/cWG7TGgiD
         UnDlr6fgVbRKT5EPtUZ6KFgDDri/U1sV7gwjDDDf5hV33DCzfg92TiaEMw82kDaqiZaQ
         qVqoMPID74uJ21uQVdAGP5hLV4PNMbUXENhYiXIkzy+AIXmWZnXhpOg5sWhIo60wA4rc
         rCU8bG4EgNW25h9O8rfNetIYBmTbtj4mUxXHURWwUZUOZLW4QyqWmrH3VwWbPkwIkMUE
         0LqgXzaA1w3OxiBuQWSCb6rFQpr4KBi/zfddFX+wQ8O3o/W+7kbpjwybzY4cffI4Ex4J
         XqIg==
X-Gm-Message-State: APuU4Z++bDx8AE7qfxmvEb3KZQ+Rz2EAOawhfeqH2jwpdU+uWecQHgxD
	Tw4pRbMpDqtdogIVdM3Wb/zPfjhlW+kfFNVOvByw7sbP4UxUbBOlN1Ff0dixr+mkjlxgSIvjft7
	lWqtxN3V/+rITcPB+g23b8ODOuBe1Kwc=
X-Gm-Gg: AZFdTZdAzr6UNE0mZFGIA3BLZ/+CFYwlHGWY7xNYBIk0Rgpbg8EohgK6iYHxsQGv5K1
	DpEXeUVhyE9Nx05gmIEZbHv4Otevnc4eE5FN+adrXrl910iVJxhFWHuxMdHJULy7P+KJva3n/m2
	nL8Cp6GdlFpBPlS5yB6eTiGbOrXSkg86zlTJlBlbIkxLjlVky92swOvu8Cg/RizetRgxffy9nyX
	YEM9hL1xs7cKqIkerzrSKhX8tpocrEUfmCGIyZAMtOC4e0pK8OvG73ZHqCjppRRq58CIEi53Df6
	6GQISG2654nYbjZDEvTtyxudI1oKh4V8rQ41LVUdq6BlvWdc856KHIjw9idvEuzti5pGEgLCFaC
	dcAG2aqBxZP0Bk6drHbf7AMEW0gZvhEfMaSiP3ECeFRT31H+wIs43h3M05CDMSfs6NZ3/iSgP
X-Received: by 2002:aa7:d355:0:b0:6ba:3867:42c8 with SMTP id
 4fb4d7f45d1cf-6ba38674444mr9429334a12.30.1795614903850; Wed, 25 Nov 2026
 05:55:03 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123063842.64536-1-juanagusnicco@gmail.com> <CADsVqVCugK=ruV+gBaUrQ5fFXG6CwH1pq7K_UH_TabF47-YOag@mail.gmail.com>
In-Reply-To: <CADsVqVCugK=ruV+gBaUrQ5fFXG6CwH1pq7K_UH_TabF47-YOag@mail.gmail.com>
From: Juan Agustin Niccolini <juanagusnicco@gmail.com>
Date: Wed, 25 Nov 2026 08:54:52 -0500
X-Gm-Features: Aa3M54r-sE3hMUxP9jZ6zXiXG9OiV7EwD5xqyvZM8gCofWupHyd_aLhlc9atgwY
Message-ID: <CACQ4AcjM=eQkaFBupHqGZD7v0Ah3D+y1x3W7Lbssbmr=9Ft2tg@mail.gmail.com>
Subject: Re: [PATCH net] tls: set the copy cursor before cloning plaintext
To: Eddy <eddsterxyz@gmail.com>
Cc: netdev@vger.kernel.org, John Fastabend <john.fastabend@gmail.com>, 
	Jakub Kicinski <kuba@kernel.org>, Sabrina Dubroca <sd@queasysnail.net>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Willem de Bruijn <willemb@google.com>, Simon Horman <horms@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, 
	Jiayuan Chen <jiayuan.chen@linux.dev>, linux-kernel@vger.kernel.org, 
	Kyle Zeng <kylebot@openai.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I don't know if you were the first. There is nothing public from you.
Kyle Zeng first reported it publicly on October 30. I discovered it
independently.


On Wed, Nov 25, 2026 at 4:27=E2=80=AFAM Eddy <eddsterxyz@gmail.com> wrote:
>
> Hello, quick question, was I the first to report this issue or was this s=
omething you were already aware of?
>
> On Mon, 23 Nov 2026 at 8:38 Juan Agustin Niccolini <juanagusnicco@gmail.c=
om> wrote:
>>
>> tls_sw_sendmsg_locked() copies into the open record by cloning space
>> with tls_clone_plaintext_msg() and filling it with
>> sk_msg_memcopy_from_iter(), which starts at sg.curr and sg.copybreak
>> as left by whatever last added to the record. The copy trusts other
>> paths to leave that cursor in the right state, and they have not.
>>
>> Since commit d829e9c4112b ("tls: convert to generic sk_msg interface"),
>> the path that adds the caller's own pages (sendpage, later splice) did
>> not move sg.curr, so the next copy wrote into those pages. Commit
>> c5a595000e26 ("net: tls, update curr on splice as well") fixed that by
>> making the splice path leave sg.curr at sg.end with copybreak 0. That
>> is only correct if the clone adds a new element. sk_msg_clone() instead
>> grows the last element when the cloned range is contiguous with it, so
>> sg.end does not move, and the copy starts at an unused slot, wraps
>> around the ring and writes from sg.start, into the spliced pages again.
>>
>> The spliced pages can be page cache pages of a file the caller opened
>> read-only, so an unprivileged user can change the cached contents of a
>> file it cannot write.
>>
>> The copy path always appends after the data already in the record, so
>> set the cursor there before cloning: on the last element with copybreak
>> at its length, or at sg.start when the record is empty, as
>> sk_msg_reset_curr() does. That holds whether the clone grows the last
>> element or adds a new one, and it covers every path that adds to the
>> record, whatever state it left the cursor in.
>>
>> This is where the cursor should have been set all along. With it set
>> here, the copy never depended on the splice path moving sg.curr, so
>> neither the original bug nor the one introduced by its fix would
>> have existed.
>>
>> I found this bug during an LLM-based audit. Kyle Zeng and Eddy
>> Tsalolikhin independently reported it before and are credited below.
>>
>> Fixes: d829e9c4112b ("tls: convert to generic sk_msg interface")
>> Fixes: c5a595000e26 ("net: tls, update curr on splice as well")
>> Reported-by: Eddy Tsalolikhin <eddsterxyz@gmail.com>
>> Reported-by: Kyle Zeng <kylebot@openai.com>
>> Closes: https://lore.kernel.org/all/20261030042138.73739-1-kylebot@opena=
i.com/
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Juan Agustin Niccolini <juanagusnicco@gmail.com>
>> ---
>> Jiayuan Chen posted "[PATCH net v1] tls: fix ring wrap in
>> sk_msg_memcopy_from_iter() after splice"
>> (https://lore.kernel.org/all/20261120225720.89044-1-jiayuan.chen@linux.d=
ev/),
>> which sets the same cursor in the splice path. The two patches touch
>> different functions and apply in either order, and this one is still
>> needed even if his goes in: his closes the splice route on mainline,
>> but not tls_sw_do_sendpage() on 6.1, 5.15 and 5.10, where it does not
>> apply, nor the record split on 7.1 and older. This patch removes the
>> copy's dependence on all of them, and applies unchanged to every
>> stable branch, because tls_clone_plaintext_msg() is the same everywhere.
>>
>> I have an exploit that lets an unprivileged process overwrite the page
>> cache of /bin/su to open a root shell. I confirmed it works on mainline
>> and 5 distros. It is available to the maintainers on request.
>>
>> On 6.1, 5.15 and 5.10 the bug is a race, but an unprivileged user
>> won it within a second in my tests. I have another reproducer
>> available for those.
>>
>> I used a fuzzer with a page cache oracle to confirm this patch fixes
>> the issue in QEMU guests on mainline 7e1392a42ea2, and all stable branch=
es:
>> 7.3.5, 7.1.13, 6.18.64, 6.12.118, 6.6.162, 6.1.192, 5.15.225, and 5.10.2=
74.
>>
>> I also confirmed that it fixes the original bug on a kernel
>> without c5a595000e26 applied.
>>
>>  net/tls/tls_sw.c | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>
>> diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
>> index 226e0f176fdc..efff7a02aef2 100644
>> --- a/net/tls/tls_sw.c
>> +++ b/net/tls/tls_sw.c
>> @@ -349,6 +349,17 @@ static int tls_clone_plaintext_msg(struct sock *sk,=
 int required)
>>          */
>>         skip =3D prot->prepend_size + msg_pl->sg.size;
>>
>> +       if (msg_pl->sg.size) {
>> +               u32 i =3D msg_pl->sg.end;
>> +
>> +               sk_msg_iter_var_prev(i);
>> +               msg_pl->sg.curr =3D i;
>> +               msg_pl->sg.copybreak =3D msg_pl->sg.data[i].length;
>> +       } else {
>> +               msg_pl->sg.curr =3D msg_pl->sg.start;
>> +               msg_pl->sg.copybreak =3D 0;
>> +       }
>> +
>>         return sk_msg_clone(sk, msg_pl, msg_en, skip, len);
>>  }
>>
>>
>> base-commit: af6737b9066832a2017c281159950ba92385ce00
>> --
>> 2.53.0
>>

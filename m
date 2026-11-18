Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795027156;
	b=G2t/2gi2PhSBdpbM1U+qKMXyxa3F+1chjWrJBJ8aoTGfQ9Jgw7poMgw84v/MtWzmLud6
	 kBbVrXe06L0/ZubRq5SBqZtzGTRCviEojClIJHXJpL+JgGorJAPdPExFu8NIWt9/qSDb2
	 0o28e1WipR/qH3ZIG4z6K9f5Jir5v2JUPODAE2rHfrx4zSWt+eHv8TGSGSyWDdsN55rSG
	 kRzIV6VD73Z0/lNZPqBjbeuCl4ggOSwI2CyslkOtUrVa3VtlX5V7nXG05fqUf4DLrM0si
	 kInUynV1eaKZpznysNh5JeecqiJAIgPksxkCBjCttIMHscmZU2HQqCoKRnudP+HxfgA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795027156;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rOk5XMLKV41q7GLzoLXIV7TkndqjJrVZPK5114ekmS8=;
	b=kP6/n+SI4Sb8vroi6AhwqB+e/qXYPVZAKYYTgCDMMG849WfE6DsvoNsMmmVtQTA/B7Z+
	 nplQQMepCkNi5LrwARBxjsXQF2gQnDsohmkLtbJOItYBxKo1AoRrQtNdmXgs+YAVShZP4
	 wiIWJbXXrw3IaGaq65XLBwIaa8x8axjNFDcBrSJXCQ7x7C9arvH7Wa+wkSIgVsB5z/0Ch
	 apEWYUzSC7d4oHABc1BaNXf3/w1GwCAwkY8DUdEkGNZQ39IMEJ5HMRGbG8bKlEYibB9Oh
	 PXOnHwCxrQkZFCq8ddGOKdwu51is38BQzBkHYg1ZK5rTqE1XjkfmMVINRJmZixoPG1w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZAaEvO25;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFB4606A320
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 18:39:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FFB4606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZAaEvO25
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-194d0c31715so929c88.0
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 10:39:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795027155; cv=none;
        d=google.com; s=arc-20260327;
        b=QGGak6UA/LR/lGuI+iNtzJsOSfwUAIbSQ0JqGJRVFHxd3I1p/b8rchRG/gt01fDFfy
         yrg6SyBCio9/IfTtqGH0FQkH6SiVbnuF5DmDA07Hf6nnTnmkmUB5hX4hWR2YQoAFSNvM
         8JziA6CDyA5iHaGGi6LmUWPwPyuK9qGa+IZqqvZ2ygiQIsQyd2z7XS8eH3p/9LBtGX+Y
         UWKVvF8rqigPOjpPjJn0BUs/we4nHxLB5NLmbYQOA2WuS9cJTSNYX6cVjW1nfMGlchL6
         6Rv2tShPR3+Qp8OLNIgQLrylHV7L7jaTzCv11czE8IWkmz3qyB8dm7SHHvyhYt8F/ATQ
         P3Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rOk5XMLKV41q7GLzoLXIV7TkndqjJrVZPK5114ekmS8=;
        fh=H3LnLo3mqK/idX9XZDKAECC1xEbFCtxL43nARbb4Pj0=;
        b=qijx57Hm5GUZ8F49hoRGmfrSt3lstfSfP53S1hCmOdT5M74S4S75PncQjNk3DPuen2
         I4ddRuH+WIzRohym1VW71lH1VnfhLv7s1fbB7asKN7gx5Gmq73R9qTVjtfVZdcNQBhrb
         BMG3lcQIFNyOE3HUqsov1kZ3X14bJxFb0xFWlb6hQFV288xPBaGFS7tM0K+z/Qaij87C
         z/AJt/LTYf6YQcfZi4WmhpromsDZoSate6JF5PJJF8+KRdQG2sp6Jiwn/Vri8MLytRtg
         ucsd7g7rPOxjRf9m5pjyC1hOZU0T53j7ybLdihY7FEZu/OOW603Vp2xlouo4PUE0YrU9
         LpMQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795027155; x=1795631955; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rOk5XMLKV41q7GLzoLXIV7TkndqjJrVZPK5114ekmS8=;
        b=ZAaEvO25CR3taVZcmnXF68wjTJix97rTrAGQ68xEM0GZSJjDB9dTmNdrvjcsjM5DAx
         MrRb8zbkzIWx50PjRSz6yorIDv8ibAviTnCQVVMSFzRQKVfZDiU6XyQs5w4HPAs5tqzD
         BsgtAY1SsuWj6nr/2cFRjkySkht8K0EsTj4DWsoLRj1zxwUM6IWMeKjUq982hpNC3ZCr
         n50I+m3FYF/WfSGc04kSTIoD5lGEfobfZQ7rtJZe77/acKLaeQOrTfCWkvAi/480aW/m
         P5BBg38eh0luesS4uP/AuaPUW5Iqh2v7QaTFsq7xfoAid8Nn8HgUQTCNX+xUS9WiQBDn
         UYVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795027155; x=1795631955;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rOk5XMLKV41q7GLzoLXIV7TkndqjJrVZPK5114ekmS8=;
        b=WLE6xk88PGFnq2C4KegT+Ky3W3aJSktvbr2Mn4m4NEA4quK7yq1EeBC8qb8crFYpJN
         A+voM7XpRHwMDUOmJ07GBu760kWLq7ANfhUCnPgGhbAZ9X2SHIWIN8MS+tQfWfq5/jUd
         lNc4stwz//qaNvcKH1KEGYkPj2r+p2l07gEl3SYmIIo2e/7s0sDYRQeVghZ3j/yteEn+
         iuD+CB3vsyfe67A48CQIT+9G97l7mnCdEoFk1lPL2bnGU4si+8oOIyfYmSe3gK66gPLn
         iO9Ez5kbp9cskRqjO4Ah3i+WANg2OoLlftdrnpJUkWqh6CkPXC5P3i8IhVF7m/98g31q
         jSWg==
X-Forwarded-Encrypted: i=1; AL+hErE9ozJ7DGJ/atxlX8tkt2tgsKs+Gi9YAbk/fHNc9vSSZeUROzwRkmVnpfDTh6EetiyHC8MnXTg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2XllgKq3ah1EtJoZ5xxT1/9cc0CJgJwPoyFdRiTPK2CUv+kdB
	eJLHsLjz+DyHaIXj8ZZDSCefzVpxuEgNyfWy4OhzAPx5fYWc4bJB1iQ5h01Sefx/XumZky9BcYf
	bAbGUYQmIdKGO1+sMcmP+m6x89jY/uIOJHm4u/Gks
X-Gm-Gg: AYBFou0mP6LuAhcMzr8agn5CzhFbU1wdYih6z+f+lX03cz2oy1HwfQ1w93cRp70mxzt
	/SRK0O6vWtPN9sR5TlIuSbUtCR+5TUGguhTBl0627HeFl33WVtWbW07H14gQc9ySUObm661MhYp
	mdKnMtSXyBylRi6Z74yupviMX6bsNUjFgCXjuTdDpqJModGga8Jj5RcH0uK07XNu+ZifAaDmWq6
	xtEmsiVBWSRunoXoyvIuUwC3zLEiWp11jSgOAdEVDSXWXSFbNpu47ky+VY83zJBEqZMZfkTJ0vL
	TBWnQAacJi1q21ccbRqpaw78GZzmw5vP4UmzOHQj8wLSu1+35pL/Tt8ZwXRr+Er0qmJ85+CP8v+
	F/ST1FRxw/DZWnO825fqsVoQ/fuo9Ot9EXVHyfg==
X-Received: by 2002:a05:701b:2903:b0:133:12e0:aab7 with SMTP id
 a92af1059eb24-1b54d350911mr22039c88.11.1795027154537; Wed, 18 Nov 2026
 10:39:14 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110102039.1002605-1-bjorn@kernel.org> <20261110102039.1002605-2-bjorn@kernel.org>
 <20261115131314.2d3ab96f@kernel.org> <87wlqcg85c.fsf@all.your.base.are.belong.to.us>
 <20261117163258.446a0c45@kernel.org>
In-Reply-To: <20261117163258.446a0c45@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Wed, 18 Nov 2026 10:39:00 -0800
X-Gm-Features: AclHuK8UJH3E_Epp2jjC1wv6_uDQD4oZqE2pXj-5wMybSCyzlV0cK1dXGLNdYt8
Message-ID: <CAHS8izNe7w5gcTrVW_gMue0-2HBbRkTpiqtUUcRGHZnPwiLp4g@mail.gmail.com>
Subject: Re: [PATCH net-next v1 01/11] net: Get skb fragment addresses through netmem
To: Jakub Kicinski <kuba@kernel.org>
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Magnus Karlsson <magnus.karlsson@intel.com>, 
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Alexander Duyck <alexanderduyck@fb.com>, kernel-team@meta.com, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Pavel Begunkov <asml.silence@gmail.com>, Jens Axboe <axboe@kernel.dk>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, netdev@vger.kernel.org, 
	bpf@vger.kernel.org, io-uring@vger.kernel.org, 
	"Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>, Weiming Shi <bestswngs@gmail.com>, 
	Nikolay Aleksandrov <razor@blackwall.org>, David Wei <dw@davidwei.uk>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Stuart Clark <stuclar@meta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 4:33=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Mon, 16 Nov 2026 15:31:27 +0100 Bj=C3=B6rn T=C3=B6pel wrote:
> > > IIRC netmem is supposed to be used for frags and memory CPU never nee=
ds
> > > to access.
> >
> > netmem covers pages too, and netmem.rst already allows readable net_iov=
s
> > ("Decouple net_iov from unreadability"); the in-tree ones just happen t=
o
> > be unreadable.
>
> Ugh, slop got in :/ I really don't think "the in-tree ones just happen
> to be unreadable." I seem to recall being involved in that design.

Oh, that was an intentional, I didn't think there was any reason
readable net_iovs couldn't exist in the future. Actually even dmabuf
net_iovs can be made readable sometimes, as some dmabufs support
dma_buf_vmap, and in theory the net_iov could hold a virtual address
derived from the return value of dma_buf_vmap that the kernel can
access.

Do you think there is a reason net_iovs can never be extended to
readable memory?

Do you want that point from netmem.rst reverted?

--=20
Thanks,
Mina

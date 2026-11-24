Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795522665;
	b=jdm5NSngvNHoJ5ZI/iNJEDvzXXPs/zB7Lc39KvDoY2seUSIuUOvsbYG2Lo3iInXhdOXT
	 3twMuXG/7OmuAFIoNyhHRam/sXC7XId/N+FPvXFEQMBGqVeCo1TTFK+KKT0uF9WCbI9kW
	 Afjtb/FlJKAMe6tfZqlxOIh/HWr3U5liy14Neo58uRULcK75ipMsn46t91iahy2y5lZDH
	 Z3JKch3JJcIuOI0CMhdtOSS+sKHGvWUmbi2CAUMx28tiVLnkfw25NoBgesK9yG3sf1+Y0
	 kaS0SFnvyYBHGg+HGzbfRbo3Ehck83a2XRbsiUBTYtkudRmt3DprsZhAc0EzjUgHyJg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795522665;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=DbmIw63aK5D8KN1MjDBOUuihKJOCEJYVlY9ddII3aL8=;
	b=q2HGypQ8uV/5eshL4LCGTngB9un02dttv/EOqtcWVZD9nCFYX2XjZ+AB4SuunmY1UnMh
	 bd/xm2WC6pdaLk2JDK11aNBna+mZ5ZaLzQgQrTeuwyOM1WKYEBxyA0Xi1vpeC1vSkwUiF
	 J30jXX8OSspu427Tj6bM7GhyP24EAkPHnEtJPLW/uOMizTbngpEe/8tUtlulbXcSamVdY
	 uVKZhIjteTcIhIaFdA555NGC/GfSB7V0G2qewAaP/G6geEi9RtRaj6wBSU0EEQ+qxCddo
	 mcv/9Qu7B4l9pa3dGb32dQBQz0qHz10KtO8/ulBn2lU6o130rwStFRD4vAobGWvZp4g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aijY3mNF;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="ByrsPr/y";
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A942C606A330
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 12:17:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A942C606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aijY3mNF;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ByrsPr/y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795522663;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DbmIw63aK5D8KN1MjDBOUuihKJOCEJYVlY9ddII3aL8=;
	b=aijY3mNFYk26Nodyhy5eSg5CG9IQDsGh/LGD/e7DjzB0LhXjHMtT8+4mjVuwKPxu62TT5Y
	RrzSwf5LEodAhliqiUUqVycHRxWEDF3fXWB0mTvFYtd9iZpN3pSacC2YKCyXpcmQrMrJ0/
	bCytnoVPjda1rVXPpFik237OtZ0cRLk=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-149-l4QorCd3Nz6worvogXXFqg-1; Tue, 24 Nov 2026 12:17:41 +0000
X-MC-Unique: l4QorCd3Nz6worvogXXFqg-1
X-Mimecast-MFC-AGG-ID: l4QorCd3Nz6worvogXXFqg_1795522661
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-836c416b236so66318647b3.0
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 04:17:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795522661; cv=none;
        d=google.com; s=arc-20260327;
        b=AaewdBxELsbCuoU17h4SrTFlDAcz7FiYp0J1UXQDpe67pbc1IN9PgMIAyWzen3vLdJ
         I1elVDTqWrHYGbtdklP7QlSUf3QKcKmzKL1/lcoMkSrOqTp9YW6WWJbI5YvClI547o04
         UFpoOeMnLGo0QG7bxruXzW7tXqEf0MQZuc4incizS31IJJA9goJQ90wkPRrQNhs3HqSK
         3JWCUbi4ssFjjs9tANPexL1w1mu9V4aH3fcODOTOgR/RV8or8GuHFwEQKMPdHTIq1Klr
         DRvoOPhNFCBVZ5G3lyamGtKlvJM5w8fvgWUTZ89vkZIeo2m8pgSr+23TtTfm4bD443ir
         qg/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DbmIw63aK5D8KN1MjDBOUuihKJOCEJYVlY9ddII3aL8=;
        fh=O4g5pDSRa3WbnVTWrdU2HE8GLFTdap32pZRqQYL3b+s=;
        b=T5RqK9P64W+j6pni13P2xMbAUHAJyvH1a6l04lirIHjtSFQxPXjxWVNt1RQ9ahNmYp
         y3ZdiIuu0EgD8raEtLe0LNKg8Uglc8DFlOARaasYZvRWcNFVECy4TLSvwR6212JqfJMb
         oDOSRn/GEHav45VuVVupGVkNQ5uinrDaOYvwEAIy06vBx/ytXjEGMivMqZwqG8tAPl4/
         t9D/GuH2uO+2X3TudMg2frxac8h+dWgAcSCBjdBbcBeew0EtESv2Jze3AacJ5FOhGR1J
         x10ou/l+OjExKOzDNsyyA87GplNjvRWZcURR6EKUjJT7pUu9fncU2rfgv04QjPrJLqC/
         EHBw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795522661; x=1796127461; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DbmIw63aK5D8KN1MjDBOUuihKJOCEJYVlY9ddII3aL8=;
        b=ByrsPr/yvg81a4ki7Lzc5fXj5+VzTLRXfhJ4XRrSf2+ryfBdQhZ9HfMfRfhmVDtnZp
         M6mOSm4BlncZKdeGE4vp4FQIuM3KHbKANYbGdLLLJZiow1MUgWD3vahwXMECs05Ibyec
         hyLwtDu125gNVcO8dOv94QkUtAtQHVUI91tE9P7m0s2KBMOx933HDImKHiqK0BGlQEFj
         rcYjpDon7FowFM8GkiMNIQt9DoVoiPQABm5Hn+J5peCSS/AVocKmzGmUIgIs2fKhDU1V
         OT2WEn3MiXo3V7nZ1gZQ1v9Gnk6mRcQATY9FXK4Yq2TqX+ywtCJz5oXOks68S1uVN8dd
         jNUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795522661; x=1796127461;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DbmIw63aK5D8KN1MjDBOUuihKJOCEJYVlY9ddII3aL8=;
        b=2hO9rr70HBX1iz5bhICRnRINM+q+8vLhpkUmgNy1xk3rGQP3QT50tael0eGPXcv8xJ
         Y/ClQSMU9KQoZPNvW0OYFRXupBIxFgZZcBKoesOYh1sggHvo9BUfGgoUYMFVk5DLWQIY
         k7oUIsodvSj9YUGzigRoHsuY+k4+6z8mDLYHYJe7IoXxX4FMx6NW8RPLgdQAPEOB/YcB
         /qZCfW/22o19kTm/Rut7oHeaJKXPeIltWfpNndZ0hVlb+JmJXPMolTz05HvK+KMIqzf6
         GOuwLtjZhfmJvWDf0s5ZxpIaG3a2wDtTjswOnrBCsqXryP0xAneEsBxtaIlTxJtN5Y4w
         RwKA==
X-Forwarded-Encrypted: i=1; AL+hErHyloHZxhJFJZWzBJfuifJw9NhK/fjCOiY8dm7UxQiJ61WU7WudyFYOf0OajdBQXZTK5jsA49o=@vger.kernel.org
X-Gm-Message-State: APuU4Z/0wm52FmVdf2UQGrdkrXdIaD616gcbwDuJT3EsoJc3OaNjQMin
	6qdePDVXi2w1pw6IDmwYigewso/aKMJqGO61fzjJk1d3CoQ3sdcm0e0x2ODWXwrkQMZGZ7jCuMe
	gI0X5RFS/N6G+jvYanQ7CfGtZeT/10yPjdwgIaD/iQEBfJexkhCyPNk96v/UdLrSj2kFoHUC/bz
	cR68CcGhFhPmg0yCA4nw0OdndLiUOw+tR0
X-Gm-Gg: AZFdTZejpJ/28moSLkVsWoKnSdbRfOMpm8RuSBvNr1+k+/ZqKAtuhQg303MoX74mPFS
	7CUqSH/hWc6U1dewKUufzSecZPC6SdBJTt/McvTXyD526lHVHF7l9NoFsHU6zZhuRFn6OXRI6vK
	qsPcZowoyAP1N2dNKpA42ImPyRFzrJwiIFKfKLq8xrVAueePbwZSCWodC1ugDx1IafBlX/0RQsT
	Vwccue49EsCOjB17LIc3NU9TcX3jRp74ovNitMb5QXDP1kxob1ue0pWC+k=
X-Received: by 2002:a05:690e:12c1:b0:67d:c0d2:d1a4 with SMTP id 956f58d0204a3-67df43f2946mr5746531d50.24.1795522661081;
        Tue, 24 Nov 2026 04:17:41 -0800 (PST)
X-Received: by 2002:a05:690e:12c1:b0:67d:c0d2:d1a4 with SMTP id
 956f58d0204a3-67df43f2946mr5746518d50.24.1795522660569; Tue, 24 Nov 2026
 04:17:40 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123192220.4013325-1-nilayvaish@google.com>
In-Reply-To: <20261123192220.4013325-1-nilayvaish@google.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 24 Nov 2026 13:17:02 +0100
X-Gm-Features: Aa3M54oMFIvhNd4yA8WUxlIHyLTQrWthI4lAaUAMGkK0ZLwLtvJCUTh2MEvQmbU
Message-ID: <CAJaqyWfVmp8KuqX_8v_QnXFysmwjNieWbosqD+R=Oqo4Pmg+5w@mail.gmail.com>
Subject: Re: [PATCH net-next] virtio_net: use page_private() accessors for the
 big-packets page chain
To: Nilay Vaish <nilayvaish@google.com>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowangio@gmail.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, 
	virtualization@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 8:22=E2=80=AFPM Nilay Vaish <nilayvaish@google.com>=
 wrote:
>
> Big packets mode chains its receive pages through page->private, reading
> and writing the field directly.
>
> struct page is being shrunk as part of the memdesc work, and its private
> field is one of those that will move. Direct users have to go through
> the accessors before that can happen.
>
> Use page_private() and set_page_private() instead, like the rest of the
> kernel, so that the driver no longer depends on where struct page keeps
> the field.
>
> No functional change.
>
> This patch was written with the help of an AI coding assistant (Gemini).
>

Acked-by: Eugenio P=C3=A9rez <eperezma@redhat.com>

> Signed-off-by: Nilay Vaish <nilayvaish@google.com>
> ---
>  drivers/net/virtio_net.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
> index 0988a946ef35..5eef2c315963 100644
> --- a/drivers/net/virtio_net.c
> +++ b/drivers/net/virtio_net.c
> @@ -680,8 +680,10 @@ static void give_pages(struct receive_queue *rq, str=
uct page *page)
>         struct page *end;
>
>         /* Find end of list, sew whole thing into vi->rq.pages. */
> -       for (end =3D page; end->private; end =3D (struct page *)end->priv=
ate);
> -       end->private =3D (unsigned long)rq->pages;
> +       for (end =3D page; page_private(end);
> +            end =3D (struct page *)page_private(end))
> +               ;
> +       set_page_private(end, (unsigned long)rq->pages);
>         rq->pages =3D page;
>  }
>
> @@ -690,9 +692,9 @@ static struct page *get_a_page(struct receive_queue *=
rq, gfp_t gfp_mask)
>         struct page *p =3D rq->pages;
>
>         if (p) {
> -               rq->pages =3D (struct page *)p->private;
> +               rq->pages =3D (struct page *)page_private(p);
>                 /* clear private here, it is used to chain pages */
> -               p->private =3D 0;
> +               set_page_private(p, 0);
>         } else
>                 p =3D alloc_page(gfp_mask);
>         return p;
> @@ -881,7 +883,7 @@ static struct sk_buff *page_to_skb(struct virtnet_inf=
o *vi,
>                  * Currently, big packets mode doesn't use page pools.
>                  */
>                 if (!rq->page_pool) {
> -                       page =3D (struct page *)page->private;
> +                       page =3D (struct page *)page_private(page);
>                         if (page)
>                                 give_pages(rq, page);
>                 }
> @@ -929,7 +931,7 @@ static struct sk_buff *page_to_skb(struct virtnet_inf=
o *vi,
>                 skb_add_rx_frag(skb, skb_shinfo(skb)->nr_frags, page, off=
set,
>                                 frag_size, truesize);
>                 len -=3D frag_size;
> -               page =3D (struct page *)page->private;
> +               page =3D (struct page *)page_private(page);
>                 offset =3D 0;
>         }
>
> @@ -2705,7 +2707,7 @@ static int add_recvbuf_big(struct virtnet_info *vi,=
 struct receive_queue *rq,
>                 sg_set_buf(&rq->sg[i], page_address(first), PAGE_SIZE);
>
>                 /* chain new page in list head to match sg */
> -               first->private =3D (unsigned long)list;
> +               set_page_private(first, (unsigned long)list);
>                 list =3D first;
>         }
>
> @@ -2725,7 +2727,7 @@ static int add_recvbuf_big(struct virtnet_info *vi,=
 struct receive_queue *rq,
>         sg_set_buf(&rq->sg[1], p + offset, PAGE_SIZE - offset);
>
>         /* chain first in list head */
> -       first->private =3D (unsigned long)list;
> +       set_page_private(first, (unsigned long)list);
>         err =3D virtqueue_add_inbuf(rq->vq, rq->sg, vi->big_packets_num_s=
kbfrags + 2,
>                                   first, gfp);
>         if (err < 0)
> --
> 2.56.1.839.g22a8290db9-goog
>


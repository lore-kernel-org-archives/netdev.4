Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795540847;
	b=xCvKA1gBak3S1J47XRegOdBQPzyQ9OOHINuHilZq4f3dgzYOjVuVqLtoM936mRFIRiaR
	 MrFzTfyQn7tO09UGiKw6+3HBYI+ehR5quM5vQylSEim0HH8k209x23Hr9Uogvgf0cYCwX
	 skR4jamrknvy8UPuwtGu4/aPJTY3QT8Rhlw04Lreae+gmEv7a0gidrGfP4ZNfK/uIMXTO
	 iRvI6pqvHVHZc6oVbSctEDq7djzdpOKytJF5PwY6pBYqxRO7NWwGkQJivNCkwdgfPPgiH
	 RioQTSyhXsos4hhk/As5Xm94FADAA9XEzKi80/e4YqkjTS+vEmawV7xaE6SAlubv39w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540847;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=3AaHa7wUvfXbgjXKSaJH9L1BQGA+L/wa6rMO4rpmjeI=;
	b=vqUJAUzt8GjhVZVvYk9vqJ0qTdu6ThFcX0Kg1PquDfb3ZRuL+mmnzJSB8v/QxCSltyeY
	 iM9k4kWpNSltXTe8bL/fV1IwwMCKzSxaqWA4bU+bx3CfvtTGrz04Z0MOAqrlP8jYlWn5X
	 eTIqXqbSMuAp1m2dLEuYV1fY6AgLBSism7UjCJLAvv4hfhjgY+c7YRA09Mcd9s0nXqlnB
	 STn9ugSdgX5l6WnclGf4+ZUM62xFIE8ZGPZ2BcUv0lNvZhWCMXB2PnzPGS+0tXNmmVfg4
	 VL+UDmr5MyH8dxQ3VAZdda0f78gXk2DRLk3XEKrIDIbSSmTBXDTihQyQ+IkQMFPOSJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cCa2s9rw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F79606A33D
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 17:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cCa2s9rw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 914811F000D3;
	Tue, 24 Nov 2026 17:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795540847;
	bh=3AaHa7wUvfXbgjXKSaJH9L1BQGA+L/wa6rMO4rpmjeI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=cCa2s9rw9bd5FmH+j5Jo8eJUhcAvO3VZ/gLWj4PN10g6F1viGQS5VrgFfZxCGeRja
	 6pnvQqn1alJ5mDRc6RX4vpFvJhwh1z6z5k2fgteCqh4S51YcR56PAditcDNzuhPjlS
	 TWnICZ0EqpHAEgOboB3jHvVFBxuSup8J2oNDp3ySj7UXowz+KX7S2YT+743o+NV+q/
	 k+54UBHgcRA2KtHptucm2UIFXkVEFQRH8EVqF2hVCc7Epii25iOBrQjunDvObCDQ3K
	 U68ZeEBpmExuAWy7EGoqCdG2Plsqks0+ig8b2fr4wjb0Zvhuwzq9RE+Cf79LYrvsdF
	 p66LMN3dWNmiQ==
Subject: Re: [PATCH net-next 12/15] batman-adv: tt: extract removal of pending
 local entry
From: netdev-bot+sashiko@kernel.org
To: sw@simonwunderlich.de
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 b.a.t.m.a.n@lists.open-mesh.org, sven@narfation.org
Date: Tue, 24 Nov 2026 17:20:46 +0000
Message-ID: <179554084613.3135.2138652598368843379@kernel.org>
In-Reply-To: <20261123171827.3294525-13-sw@simonwunderlich.de>
References: <20261123171827.3294525-13-sw@simonwunderlich.de>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
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

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The kernel-docs of batadv_tt_local_unhash() and
  batadv_tt_local_unhash_pending() disagree about who checks that the…

--

batman-adv: tt: extract removal of pending local entry

This moves the removal of a single pending entry out of
batadv_tt_local_purge_pending_clients() into a new helper,
batadv_tt_local_unhash_pending(). The helper calls a lower level
batadv_tt_local_unhash(), which does the actual unhash steps. There is
no functional change.

> diff --git a/net/batman-adv/translation-table.c b/net/batman-adv/translation-table.c
> index 0c5e21f3ba756..2a7f50de70fc8 100644
> --- a/net/batman-adv/translation-table.c
> +++ b/net/batman-adv/translation-table.c
> @@ -1760,6 +1760,44 @@ int batadv_tt_local_dump(struct sk_buff *msg, struct netlink_callback *cb)
>  	return ret;
>  }
>  
> +/**
> + * batadv_tt_local_unhash() - remove an entry from the local table
> + * @bat_priv: the bat priv with all the mesh interface information
> + * @tt_local: the local TT entry to remove
> + * @message: message to append to the log on deletion
> + *
> + * The caller must hold the hash bucket list_lock and the flags_lock of the
> + * entry. It must have checked that the entry is still part of the local table
> + * and has to drop the reference of the hash after it released the flags_lock.
> + */

[ ... ]

> @@ -4550,6 +4588,43 @@ static void batadv_tt_local_transition_new(struct batadv_priv *bat_priv)
>  	}
>  }
>  
> +/**
> + * batadv_tt_local_unhash_pending() - remove a pending entry from the local table
> + * @bat_priv: the bat priv with all the mesh interface information
> + * @tt_local: the local TT entry to remove
> + *
> + * Only an entry which is marked as BATADV_TT_CLIENT_PENDING and whose DEL was
> + * queued is removed. An entry which still waits for its DEL (del_unqueued) must
> + * stay in the local table until batadv_tt_local_purge_list() was able to queue
> + * it.
> + *
> + * The caller must hold the hash bucket list_lock and the flags_lock of the
> + * entry.
> + *
> + * Return: true if the entry was unhashed and the caller has to drop the
> + * reference of the hash, false otherwise.
> + */
> +static bool
> +batadv_tt_local_unhash_pending(struct batadv_priv *bat_priv,
> +			       struct batadv_tt_local_entry *tt_local)
> +	__must_hold(&tt_local->common.flags_lock)
> +{
> +	struct batadv_tt_common_entry *tt_common = &tt_local->common;
> +
> +	lockdep_assert_held(&tt_common->flags_lock);
> +
> +	if (!(tt_common->flags & BATADV_TT_CLIENT_PENDING))
> +		return false;
> +
> +	/* the removal must be announced first */
> +	if (tt_local->del_unqueued)
> +		return false;
> +
> +	batadv_tt_local_unhash(bat_priv, tt_local, "pending");
> +
> +	return true;
> +}

[Severity: Low]
This isn't a bug, but the kernel-doc of batadv_tt_local_unhash_pending()
seems to leave out a requirement it inherits from batadv_tt_local_unhash().

The kernel-doc of batadv_tt_local_unhash() says the caller "must have
checked that the entry is still part of the local table". That function
does not check hlist_unhashed() itself. It always calls
hlist_del_init_rcu(), increments hash->generation and calls
batadv_tt_local_size_dec() for entries without BATADV_TT_CLIENT_NEW.

batadv_tt_local_unhash_pending() checks only BATADV_TT_CLIENT_PENDING and
del_unqueued before it calls batadv_tt_local_unhash(). Its kernel-doc asks
callers only to hold the bucket list_lock and the flags_lock. It still
says that a true return means the caller must drop the hash reference.

batadv_tt_local_unhash() does not clear the flags. So an entry that was
already unhashed can still have BATADV_TT_CLIENT_PENDING set with
del_unqueued false.

A caller that relied only on the documented contract of the wrapper could
pass such an entry and get true back. The per-VID size would then be
decremented twice and the hash reference put twice.

There is no such caller now. Both batadv_tt_local_purge_pending_clients()
and the batadv_tt_local_commit_change() caller added later in the series
find the entry by walking the bucket under list_lock.

Could the kernel-doc of batadv_tt_local_unhash_pending() state the same
membership requirement as batadv_tt_local_unhash()? Another option would
be an hlist_unhashed() check inside the wrapper.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261123171827.3294525-2-sw%40simonwunderlich.de
